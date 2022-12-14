import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ChatGroupsWidget extends StatefulWidget {
  const ChatGroupsWidget({Key? key}) : super(key: key);

  @override
  _ChatGroupsWidgetState createState() => _ChatGroupsWidgetState();
}

class _ChatGroupsWidgetState extends State<ChatGroupsWidget> {
  PagingController<DocumentSnapshot?, ChatsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '1szv7479' /* 내 그룹 */,
          ),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('ChatCreateGroup');
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: PagedListView<DocumentSnapshot<Object?>?, ChatsRecord>(
            pagingController: () {
              final Query<Object?> Function(Query<Object?>) queryBuilder =
                  (chatsRecord) => chatsRecord
                      .where('users', arrayContains: currentUserReference)
                      .orderBy('last_message_time', descending: true);
              if (_pagingController != null) {
                final query = queryBuilder(ChatsRecord.collection);
                if (query != _pagingQuery) {
                  // The query has changed
                  _pagingQuery = query;
                  _streamSubscriptions.forEach((s) => s?.cancel());
                  _streamSubscriptions.clear();
                  _pagingController!.refresh();
                }
                return _pagingController!;
              }

              _pagingController = PagingController(firstPageKey: null);
              _pagingQuery = queryBuilder(ChatsRecord.collection);
              _pagingController!.addPageRequestListener((nextPageMarker) {
                queryChatsRecordPage(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where('users', arrayContains: currentUserReference)
                      .orderBy('last_message_time', descending: true),
                  nextPageMarker: nextPageMarker,
                  pageSize: 25,
                  isStream: true,
                ).then((page) {
                  _pagingController!.appendPage(
                    page.data,
                    page.nextPageMarker,
                  );
                  final streamSubscription = page.dataStream?.listen((data) {
                    final itemIndexes = _pagingController!.itemList!
                        .asMap()
                        .map((k, v) => MapEntry(v.reference.id, k));
                    data.forEach((item) {
                      final index = itemIndexes[item.reference.id];
                      final items = _pagingController!.itemList!;
                      if (index != null) {
                        items.replaceRange(index, index + 1, [item]);
                        _pagingController!.itemList = {
                          for (var item in items) item.reference: item
                        }.values.toList();
                      }
                    });
                    setState(() {});
                  });
                  _streamSubscriptions.add(streamSubscription);
                });
              });
              return _pagingController!;
            }(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<ChatsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewChatsRecord =
                    _pagingController!.itemList![listViewIndex];
                return StreamBuilder<FFChatInfo>(
                  stream: FFChatManager.instance
                      .getChatInfo(chatRecord: listViewChatsRecord),
                  builder: (context, snapshot) {
                    final chatInfo =
                        snapshot.data ?? FFChatInfo(listViewChatsRecord);
                    return FFChatPreview(
                      onTap: () => context.pushNamed(
                        'Chat',
                        queryParams: {
                          'chatUser': serializeParam(
                            chatInfo.otherUsers.length == 1
                                ? chatInfo.otherUsersList.first
                                : null,
                            ParamType.Document,
                          ),
                          'chatRef': serializeParam(
                            chatInfo.chatRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chatUser': chatInfo.otherUsers.length == 1
                              ? chatInfo.otherUsersList.first
                              : null,
                        },
                      ),
                      lastChatText: chatInfo.chatPreviewMessage(),
                      lastChatTime: listViewChatsRecord.lastMessageTime,
                      seen: listViewChatsRecord.lastMessageSeenBy!
                          .contains(currentUserReference),
                      title: chatInfo.chatPreviewTitle(),
                      userProfilePic: chatInfo.chatPreviewPic(),
                      color: Color(0xFFEEF0F5),
                      unreadColor: Colors.blue,
                      titleTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      dateTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0x73000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      previewTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Color(0x73000000),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                      borderRadius: BorderRadius.circular(0),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
