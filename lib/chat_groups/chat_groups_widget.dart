import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/empty_chat_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatGroups'});
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
          '내 그룹',
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
                logFirebaseEvent('CHAT_GROUPS_PAGE_Icon_u7ed0r4c_ON_TAP');
                logFirebaseEvent('Icon_navigate_to');

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
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                labelColor: FlutterFlowTheme.of(context).primaryColor,
                labelStyle: FlutterFlowTheme.of(context).bodyText1,
                indicatorColor: FlutterFlowTheme.of(context).primaryColor,
                tabs: [
                  Tab(
                    text: '운동 모집 채팅',
                  ),
                  Tab(
                    text: '내 채팅',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          ChatsRecord>(
                        pagingController: () {
                          final Query<Object?> Function(Query<Object?>)
                              queryBuilder = (chatsRecord) => chatsRecord
                                  .orderBy('className', descending: true)
                                  .orderBy('timeSlotDate');
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

                          _pagingController =
                              PagingController(firstPageKey: null);
                          _pagingQuery = queryBuilder(ChatsRecord.collection);
                          _pagingController!
                              .addPageRequestListener((nextPageMarker) {
                            queryChatsRecordPage(
                              queryBuilder: (chatsRecord) => chatsRecord
                                  .orderBy('className', descending: true)
                                  .orderBy('timeSlotDate'),
                              nextPageMarker: nextPageMarker,
                              pageSize: 25,
                              isStream: true,
                            ).then((page) {
                              _pagingController!.appendPage(
                                page.data,
                                page.nextPageMarker,
                              );
                              final streamSubscription =
                                  page.dataStream?.listen((data) {
                                data.forEach((item) {
                                  final itemIndexes = _pagingController!
                                      .itemList!
                                      .asMap()
                                      .map((k, v) =>
                                          MapEntry(v.reference.id, k));
                                  final index = itemIndexes[item.reference.id];
                                  final items = _pagingController!.itemList!;
                                  if (index != null) {
                                    items
                                        .replaceRange(index, index + 1, [item]);
                                    _pagingController!.itemList = {
                                      for (var item in items)
                                        item.reference: item
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
                              width: 40,
                              height: 40,
                              child: SpinKitRing(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 40,
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) => Center(
                            child: EmptyChatWidget(),
                          ),
                          itemBuilder: (context, _, listViewIndex) {
                            final listViewChatsRecord =
                                _pagingController!.itemList![listViewIndex];
                            return Visibility(
                              visible: functions.showClass(
                                      listViewChatsRecord.timeSlotDate!,
                                      listViewChatsRecord.classTime!)! &&
                                  (listViewChatsRecord.users!.toList().length >=
                                      1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: StreamBuilder<List<ReservationsRecord>>(
                                  stream: queryReservationsRecord(
                                    queryBuilder: (reservationsRecord) =>
                                        reservationsRecord
                                            .where('timeSlot',
                                                isEqualTo: listViewChatsRecord
                                                    .timeSlotRef)
                                            .where('date',
                                                isEqualTo: listViewChatsRecord
                                                    .timeSlotDate),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ReservationsRecord>
                                        chatGroupReservationsRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x41000000),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where('admin',
                                                  isEqualTo: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 40,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              containerUsersRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: StreamBuilder<
                                                List<ClassesRecord>>(
                                              stream: queryClassesRecord(
                                                queryBuilder: (classesRecord) =>
                                                    classesRecord.where('name',
                                                        isEqualTo:
                                                            listViewChatsRecord
                                                                .className),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ClassesRecord>
                                                    containerClassesRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerClassesRecord =
                                                    containerClassesRecordList
                                                            .isNotEmpty
                                                        ? containerClassesRecordList
                                                            .first
                                                        : null;
                                                return InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CHAT_GROUPS_Container_32bzw73d_ON_TAP');
                                                    if (chatGroupReservationsRecordList
                                                            .where((e) =>
                                                                e.user ==
                                                                currentUserReference)
                                                            .toList()
                                                            .length >=
                                                        1) {
                                                      logFirebaseEvent(
                                                          'Container_alert_dialog');
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '채팅방으로 가기'),
                                                                    content: Text(
                                                                        '이미 예약한 수업입니다! 채팅방으로 가시겠습니까?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            '아니요'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            '예'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (!confirmDialogResponse) {
                                                        return;
                                                      }
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'Chat',
                                                        queryParams: {
                                                          'chatRef':
                                                              serializeParam(
                                                            listViewChatsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'chatUserList':
                                                              serializeParam(
                                                            listViewChatsRecord
                                                                .users!
                                                                .toList(),
                                                            ParamType
                                                                .DocumentReference,
                                                            true,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      return;
                                                    } else {
                                                      if (chatGroupReservationsRecordList
                                                              .length <
                                                          listViewChatsRecord
                                                              .maxUsers!) {
                                                        if (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.currCredits,
                                                                0) >=
                                                            containerClassesRecord!
                                                                .creditsRequired!) {
                                                          logFirebaseEvent(
                                                              'Container_alert_dialog');
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            '수업을 예약하시겠습니까?'),
                                                                        content:
                                                                            Text('수업 예약 취소는 수업 시작 24시간 전에만 가능합니다'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('아니요'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('예!'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            logFirebaseEvent(
                                                                'Container_group_chat_action');
                                                            await FFChatManager
                                                                .instance
                                                                .addGroupMembers(
                                                              listViewChatsRecord,
                                                              [
                                                                currentUserReference!
                                                              ],
                                                            );
                                                          } else {
                                                            return;
                                                          }

                                                          logFirebaseEvent(
                                                              'Container_backend_call');

                                                          final reservationsCreateData =
                                                              createReservationsRecordData(
                                                            date: listViewChatsRecord
                                                                .timeSlotDate,
                                                            timeSlot:
                                                                listViewChatsRecord
                                                                    .timeSlotRef,
                                                            user:
                                                                currentUserReference,
                                                            classRequiredCredits:
                                                                containerClassesRecord!
                                                                    .creditsRequired,
                                                            className:
                                                                listViewChatsRecord
                                                                    .className,
                                                            time:
                                                                listViewChatsRecord
                                                                    .classTime,
                                                          );
                                                          await ReservationsRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  reservationsCreateData);
                                                          logFirebaseEvent(
                                                              'Container_backend_call');

                                                          final usersUpdateData =
                                                              {
                                                            'currCredits':
                                                                FieldValue.increment(
                                                                    -(containerClassesRecord!
                                                                        .creditsRequired!)),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData);
                                                          logFirebaseEvent(
                                                              'Container_trigger_push_notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                'Reservation!',
                                                            notificationText:
                                                                '${currentUserDisplayName != null && currentUserDisplayName != '' ? currentUserDisplayName : currentUserEmail} - ${containerClassesRecord!.name}',
                                                            userRefs:
                                                                containerUsersRecordList
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                            initialPageName:
                                                                'ChatGroups',
                                                            parameterData: {},
                                                          );
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'Chat',
                                                            queryParams: {
                                                              'chatRef':
                                                                  serializeParam(
                                                                listViewChatsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'chatUserList':
                                                                  serializeParam(
                                                                listViewChatsRecord
                                                                    .users!
                                                                    .toList(),
                                                                ParamType
                                                                    .DocumentReference,
                                                                true,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '크레딧이 부족합니다!'),
                                                                content: Text(
                                                                    '크레딧 충전 후 사용해주세요! :)'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        '확인'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }

                                                        return;
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  '수업 예약 마감!'),
                                                              content: Text(
                                                                  '수업 예약 취소가 발생하면 다시 예약해주세요!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      '확인'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 12, 8, 12),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 40,
                                                            height: 40,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  containerClassesRecord!
                                                                      .image!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        listViewChatsRecord
                                                                            .className!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '${listViewChatsRecord.timeSlotDate} - ${listViewChatsRecord.classTime}수업',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF090F13),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${listViewChatsRecord.users!.toList().length.toString()}/${listViewChatsRecord.maxUsers?.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF7C8791),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        listViewChatsRecord
                                                                            .lastMessage!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF090F13),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      if (listViewChatsRecord
                                                                              .lastMessage !=
                                                                          '')
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            'relative',
                                                                            listViewChatsRecord.lastMessageTime!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF7C8791),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final userRefs = listViewChatsRecord
                                                                          .users!
                                                                          .toList();
                                                                      return SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: List.generate(
                                                                              userRefs.length,
                                                                              (userRefsIndex) {
                                                                            final userRefsItem =
                                                                                userRefs[userRefsIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
                                                                              child: StreamBuilder<UsersRecord>(
                                                                                stream: UsersRecord.getDocument(userRefsItem),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        child: SpinKitRing(
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          size: 40,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  final textUsersRecord = snapshot.data!;
                                                                                  return Text(
                                                                                    '${textUsersRecord.displayName} ',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF090F13),
                                                                                          fontSize: 14,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          }),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: StreamBuilder<List<ChatsRecord>>(
                        stream: queryChatsRecord(
                          queryBuilder: (chatsRecord) => chatsRecord
                              .where('users',
                                  arrayContains: currentUserReference)
                              .orderBy('last_message_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SpinKitRing(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          List<ChatsRecord> listViewChatsRecordList =
                              snapshot.data!;
                          if (listViewChatsRecordList.isEmpty) {
                            return Center(
                              child: EmptyChatWidget(),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewChatsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewChatsRecord =
                                  listViewChatsRecordList[listViewIndex];
                              return Visibility(
                                visible: functions.showClass(
                                        listViewChatsRecord.timeSlotDate!,
                                        listViewChatsRecord.classTime!) ??
                                    true,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CHAT_GROUPS_PAGE_ChatGroup_ON_TAP');
                                      logFirebaseEvent('ChatGroup_navigate_to');

                                      context.pushNamed(
                                        'Chat',
                                        queryParams: {
                                          'chatRef': serializeParam(
                                            listViewChatsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'chatUserList': serializeParam(
                                            listViewChatsRecord.users!.toList(),
                                            ParamType.DocumentReference,
                                            true,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x41000000),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 8, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            StreamBuilder<List<ClassesRecord>>(
                                              stream: queryClassesRecord(
                                                queryBuilder: (classesRecord) =>
                                                    classesRecord.where('name',
                                                        isEqualTo:
                                                            listViewChatsRecord
                                                                .className),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ClassesRecord>
                                                    circleImageClassesRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final circleImageClassesRecord =
                                                    circleImageClassesRecordList
                                                            .isNotEmpty
                                                        ? circleImageClassesRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: 40,
                                                  height: 40,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    circleImageClassesRecord!
                                                        .image!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          listViewChatsRecord
                                                              .className!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: Text(
                                                            '${listViewChatsRecord.timeSlotDate} - ${listViewChatsRecord.classTime}수업',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${listViewChatsRecord.users!.toList().length.toString()}/${listViewChatsRecord.maxUsers?.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF7C8791),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: Text(
                                                            listViewChatsRecord
                                                                .lastMessage!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          dateTimeFormat(
                                                            'relative',
                                                            listViewChatsRecord
                                                                .lastMessageTime!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF7C8791),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final userRefsList =
                                                            listViewChatsRecord
                                                                .users!
                                                                .toList();
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: List.generate(
                                                                userRefsList
                                                                    .length,
                                                                (userRefsListIndex) {
                                                              final userRefsListItem =
                                                                  userRefsList[
                                                                      userRefsListIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            1,
                                                                            0),
                                                                child: StreamBuilder<
                                                                    UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          userRefsListItem),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          child:
                                                                              SpinKitRing(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                40,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final textUsersRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      '${textUsersRecord.displayName} ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF090F13),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
