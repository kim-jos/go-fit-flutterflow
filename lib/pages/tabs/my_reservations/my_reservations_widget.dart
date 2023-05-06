import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/empty_reservation/empty_reservation_widget.dart';
import '/components/no_time_slots_available/no_time_slots_available_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'my_reservations_model.dart';
export 'my_reservations_model.dart';

class MyReservationsWidget extends StatefulWidget {
  const MyReservationsWidget({Key? key}) : super(key: key);

  @override
  _MyReservationsWidgetState createState() => _MyReservationsWidgetState();
}

class _MyReservationsWidgetState extends State<MyReservationsWidget> {
  late MyReservationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyReservationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MyReservations'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            '예약현황',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Pretendard',
                  color: FlutterFlowTheme.of(context).black600,
                  fontSize: 22.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder<List<ReservationsRecord>>(
                  stream: queryReservationsRecord(
                    queryBuilder: (reservationsRecord) => reservationsRecord
                        .where('user', isEqualTo: currentUserReference),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 30.0,
                          ),
                        ),
                      );
                    }
                    List<ReservationsRecord>
                        myReservationsCalendarReservationsRecordList =
                        snapshot.data!;
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MY_RESERVATIONS_Container_i1axdjr7_ON_TA');
                        // Rebuild My Reservations
                        logFirebaseEvent(
                            'MyReservationsCalendar_RebuildMyReservat');
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 400.0,
                        child: custom_widgets.MyReservationsCalendar(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 400.0,
                          allReservations:
                              myReservationsCalendarReservationsRecordList
                                  .toList(),
                          onTap: () async {},
                        ),
                      ),
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final appStateReservations =
                        FFAppState().myReservations.toList();
                    if (appStateReservations.isEmpty) {
                      return Center(
                        child: NoTimeSlotsAvailableWidget(),
                      );
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(appStateReservations.length,
                          (appStateReservationsIndex) {
                        final appStateReservationsItem =
                            appStateReservations[appStateReservationsIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 12.0, 10.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 102.0,
                            constraints: BoxConstraints(
                              maxHeight: 500.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 5.0, 16.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://picsum.photos/seed/314/600',
                                      width: 100.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      appStateReservationsItem,
                                                      r'''$.className''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            appStateReservationsItem,
                                                            r'''$.startTime''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<List<UsersRecord>>(
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
                                                      width: 30.0,
                                                      height: 30.0,
                                                      child: SpinKitCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    iconUsersRecordList =
                                                    snapshot.data!;
                                                return Icon(
                                                  Icons.cancel_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  size: 24.0,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
                if (loggedIn)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        ReservationsRecord>(
                      pagingController: () {
                        final Query<Object?> Function(Query<Object?>)
                            queryBuilder =
                            (reservationsRecord) => reservationsRecord
                                .where('user', isEqualTo: currentUserReference)
                                .where('isFinal', isEqualTo: true)
                                .orderBy('createdAt', descending: true);
                        if (_model.pagingController != null) {
                          final query =
                              queryBuilder(ReservationsRecord.collection);
                          if (query != _model.pagingQuery) {
                            // The query has changed
                            _model.pagingQuery = query;
                            _model.streamSubscriptions
                                .forEach((s) => s?.cancel());
                            _model.streamSubscriptions.clear();
                            _model.pagingController!.refresh();
                          }
                          return _model.pagingController!;
                        }

                        _model.pagingController =
                            PagingController(firstPageKey: null);
                        _model.pagingQuery =
                            queryBuilder(ReservationsRecord.collection);
                        _model.pagingController!
                            .addPageRequestListener((nextPageMarker) {
                          queryReservationsRecordPage(
                            queryBuilder: (reservationsRecord) =>
                                reservationsRecord
                                    .where('user',
                                        isEqualTo: currentUserReference)
                                    .where('isFinal', isEqualTo: true)
                                    .orderBy('createdAt', descending: true),
                            nextPageMarker: nextPageMarker,
                            pageSize: 5,
                            isStream: true,
                          ).then((page) {
                            _model.pagingController!.appendPage(
                              page.data,
                              page.nextPageMarker,
                            );
                            final streamSubscription =
                                page.dataStream?.listen((data) {
                              data.forEach((item) {
                                final itemIndexes = _model
                                    .pagingController!.itemList!
                                    .asMap()
                                    .map((k, v) => MapEntry(v.reference.id, k));
                                final index = itemIndexes[item.reference.id];
                                final items =
                                    _model.pagingController!.itemList!;
                                if (index != null) {
                                  items.replaceRange(index, index + 1, [item]);
                                  _model.pagingController!.itemList = {
                                    for (var item in items) item.reference: item
                                  }.values.toList();
                                }
                              });
                              setState(() {});
                            });
                            _model.streamSubscriptions.add(streamSubscription);
                          });
                        });
                        return _model.pagingController!;
                      }(),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<ReservationsRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: SpinKitCircle(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: EmptyReservationWidget(),
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewReservationsRecord =
                              _model.pagingController!.itemList![listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 12.0, 10.0, 1.0),
                            child: FutureBuilder<ClassAvailableTimeSlotsRecord>(
                              future:
                                  ClassAvailableTimeSlotsRecord.getDocumentOnce(
                                      listViewReservationsRecord.timeSlot!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 30.0,
                                      ),
                                    ),
                                  );
                                }
                                final containerClassAvailableTimeSlotsRecord =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 102.0,
                                  constraints: BoxConstraints(
                                    maxHeight: 500.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        StreamBuilder<ClassesRecord>(
                                          stream: ClassesRecord.getDocument(
                                              containerClassAvailableTimeSlotsRecord
                                                  .classRef!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child: SpinKitCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final imageClassesRecord =
                                                snapshot.data!;
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    imageClassesRecord.image!,
                                                width: 100.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewReservationsRecord
                                                              .className!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewReservationsRecord
                                                                    .date!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                ' - ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                containerClassAvailableTimeSlotsRecord
                                                                    .startTime!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (listViewReservationsRecord
                                                          .startTime! >=
                                                      getCurrentTimestamp)
                                                    StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord.where(
                                                                    'admin',
                                                                    isEqualTo:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            iconUsersRecordList =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'MY_RESERVATIONS_Icon_k9l9cpr5_ON_TAP');
                                                            if (functions.differenceInHours(
                                                                    getCurrentTimestamp,
                                                                    functions.dateAndTimeStringParser(
                                                                        listViewReservationsRecord
                                                                            .date!,
                                                                        listViewReservationsRecord
                                                                            .time!)) <
                                                                containerClassAvailableTimeSlotsRecord
                                                                    .minHoursToCancel!) {
                                                              logFirebaseEvent(
                                                                  'Icon_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '예약취소 불가능'),
                                                                    content: Text(
                                                                        '예약 취소는 수업 시작 24시간 전에만 가능합니다'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            '확인'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              return;
                                                            }
                                                            logFirebaseEvent(
                                                                'Icon_alert_dialog');
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('예약을 취소하시겠습니까?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('아니요'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('예'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (!confirmDialogResponse) {
                                                              return;
                                                            }
                                                            // reservations collection
                                                            logFirebaseEvent(
                                                                'Icon_reservationscollection');
                                                            await listViewReservationsRecord
                                                                .reference
                                                                .delete();
                                                            // Increment credits
                                                            logFirebaseEvent(
                                                                'Icon_Incrementcredits');

                                                            final usersUpdateData =
                                                                {
                                                              'currCredits':
                                                                  FieldValue.increment(
                                                                      listViewReservationsRecord
                                                                          .classRequiredCredits!),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData);
                                                            logFirebaseEvent(
                                                                'Icon_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '예약 취소 완료'),
                                                                  content: Text(
                                                                      '예약이 취소됐습니다'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          '확인'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            logFirebaseEvent(
                                                                'Icon_trigger_push_notification');
                                                            triggerPushNotification(
                                                              notificationTitle:
                                                                  '${listViewReservationsRecord.className} 예약취소',
                                                              notificationText:
                                                                  '${listViewReservationsRecord.date} - ${listViewReservationsRecord.time} ${currentUserDisplayName}',
                                                              userRefs:
                                                                  iconUsersRecordList
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList(),
                                                              initialPageName:
                                                                  'Classes',
                                                              parameterData: {},
                                                            );
                                                            logFirebaseEvent(
                                                                'Icon_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'Cancel - ${listViewReservationsRecord.className}');
                                                            logFirebaseEvent(
                                                                'Icon_navigate_to');
                                                            if (Navigator.of(
                                                                    context)
                                                                .canPop()) {
                                                              context.pop();
                                                            }
                                                            context.pushNamed(
                                                                'Classes');
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .cancel_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .grayIcon,
                                                            size: 24.0,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                              if (listViewReservationsRecord
                                                      .startTime! <
                                                  getCurrentTimestamp)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 15.0, 0.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryReviewsRecordCount(
                                                      queryBuilder: (reviewsRecord) =>
                                                          reviewsRecord.where(
                                                              'reservationRef',
                                                              isEqualTo:
                                                                  listViewReservationsRecord
                                                                      .reference),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            child:
                                                                SpinKitCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      int textCount =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'MY_RESERVATIONS_Text_kjblc65q_ON_TAP');
                                                          if (textCount == 1) {
                                                            return;
                                                          }
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                            'Review',
                                                            queryParams: {
                                                              'classRef':
                                                                  serializeParam(
                                                                containerClassAvailableTimeSlotsRecord
                                                                    .classRef,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'reservationRef':
                                                                  serializeParam(
                                                                listViewReservationsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Text(
                                                          textCount == 1
                                                              ? '리뷰 작성 완료! :)'
                                                              : '리뷰 작성하기',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
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
                                );
                              },
                            ),
                          );
                        },
                      ),
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
