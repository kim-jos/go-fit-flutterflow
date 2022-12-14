import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/confirmation_cancel_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MyReservationsWidget extends StatefulWidget {
  const MyReservationsWidget({Key? key}) : super(key: key);

  @override
  _MyReservationsWidgetState createState() => _MyReservationsWidgetState();
}

class _MyReservationsWidgetState extends State<MyReservationsWidget> {
  PagingController<DocumentSnapshot?, ReservationsRecord>? _pagingController;
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'gwavr9ay' /* 예약현황 */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'cvfu770k' /* 최신 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
                PagedListView<DocumentSnapshot<Object?>?, ReservationsRecord>(
                  pagingController: () {
                    final Query<Object?> Function(Query<Object?>) queryBuilder =
                        (reservationsRecord) => reservationsRecord
                            .where('date',
                                isGreaterThanOrEqualTo: dateTimeFormat(
                                          'd/M/y',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ) !=
                                        ''
                                    ? dateTimeFormat(
                                        'd/M/y',
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )
                                    : null)
                            .where('user', isEqualTo: currentUserReference)
                            .orderBy('date', descending: true);
                    if (_pagingController != null) {
                      final query = queryBuilder(ReservationsRecord.collection);
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
                    _pagingQuery = queryBuilder(ReservationsRecord.collection);
                    _pagingController!.addPageRequestListener((nextPageMarker) {
                      queryReservationsRecordPage(
                        queryBuilder: (reservationsRecord) => reservationsRecord
                            .where('date',
                                isGreaterThanOrEqualTo: dateTimeFormat(
                                          'd/M/y',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ) !=
                                        ''
                                    ? dateTimeFormat(
                                        'd/M/y',
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )
                                    : null)
                            .where('user', isEqualTo: currentUserReference)
                            .orderBy('date', descending: true),
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
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate:
                      PagedChildBuilderDelegate<ReservationsRecord>(
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
                      final listViewReservationsRecord =
                          _pagingController!.itemList![listViewIndex];
                      return Visibility(
                        visible: !listViewReservationsRecord.isCancelled!,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 1),
                          child: FutureBuilder<ClassAvailableTimeSlotsRecord>(
                            future:
                                ClassAvailableTimeSlotsRecord.getDocumentOnce(
                                    listViewReservationsRecord.timeSlot!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final containerClassAvailableTimeSlotsRecord =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                height: 91,
                                constraints: BoxConstraints(
                                  maxHeight: 500,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewReservationsRecord
                                                .className!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 0),
                                                child: Text(
                                                  listViewReservationsRecord
                                                      .date!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 0),
                                                child: Text(
                                                  containerClassAvailableTimeSlotsRecord
                                                      .startTime!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: ConfirmationCancelWidget(
                                                  className:
                                                      listViewReservationsRecord
                                                          .className,
                                                  date:
                                                      listViewReservationsRecord
                                                          .date,
                                                  time:
                                                      containerClassAvailableTimeSlotsRecord
                                                          .startTime,
                                                  reservationsRef:
                                                      listViewReservationsRecord
                                                          .reference,
                                                  creditsRequired:
                                                      listViewReservationsRecord
                                                          .classRequiredCredits,
                                                  classRef:
                                                      containerClassAvailableTimeSlotsRecord
                                                          .classRef,
                                                  timeSlotRef:
                                                      containerClassAvailableTimeSlotsRecord
                                                          .reference,
                                                  chatRef:
                                                      containerClassAvailableTimeSlotsRecord
                                                          .chatGroup,
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Icon(
                                          Icons.cancel_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
