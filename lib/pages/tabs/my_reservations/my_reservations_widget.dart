import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/empty_reservation/empty_reservation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MY_RESERVATIONS_MyReservations_ON_INIT_S');
      logFirebaseEvent('MyReservations_update_app_state');
      setState(() {
        FFAppState().reservationDate =
            functions.stripTimeFromDate(getCurrentTimestamp);
      });
    });

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

    return StreamBuilder<List<ReservationsRecord>>(
      stream: queryReservationsRecord(
        queryBuilder: (reservationsRecord) => reservationsRecord
            .where('user', isEqualTo: currentUserReference)
            .where('isFinal', isEqualTo: true)
            .orderBy('startTime'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child: SpinKitWanderingCubes(
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
            ),
          );
        }
        List<ReservationsRecord> myReservationsReservationsRecordList =
            snapshot.data!;
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
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    custom_widgets.MyReservationsCalendar(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.4,
                      allReservations: myReservationsReservationsRecordList,
                    ),
                    if (loggedIn)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Builder(
                          builder: (context) {
                            final myReservations =
                                myReservationsReservationsRecordList.toList();
                            if (myReservations.isEmpty) {
                              return Center(
                                child: EmptyReservationWidget(),
                              );
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: myReservations.length,
                              itemBuilder: (context, myReservationsIndex) {
                                final myReservationsItem =
                                    myReservations[myReservationsIndex];
                                return Visibility(
                                  visible: FFAppState().reservationDate ==
                                      functions.stripTimeFromDate(
                                          myReservationsItem.startTime!),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 12.0, 10.0, 1.0),
                                    child: FutureBuilder<
                                        ClassAvailableTimeSlotsRecord>(
                                      future: ClassAvailableTimeSlotsRecord
                                          .getDocumentOnce(
                                              myReservationsItem.timeSlot!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitWanderingCubes(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          height: 142.0,
                                          constraints: BoxConstraints(
                                            maxHeight: 500.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 5.0, 5.0),
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
                                                          child:
                                                              SpinKitWanderingCubes(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            imageClassesRecord
                                                                .image,
                                                        width: 120.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Expanded(
                                                  child: Padding(
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
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    myReservationsItem
                                                                        .className,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Pretendard',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            'M/d h:mm a',
                                                                            myReservationsItem.startTime!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Pretendard',
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        if (myReservationsItem
                                                                .startTime! <
                                                            getCurrentTimestamp)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FutureBuilder<
                                                                    int>(
                                                              future:
                                                                  queryReviewsRecordCount(
                                                                queryBuilder: (reviewsRecord) => reviewsRecord.where(
                                                                    'reservationRef',
                                                                    isEqualTo:
                                                                        myReservationsItem
                                                                            .reference),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          SpinKitWanderingCubes(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                int textCount =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'MY_RESERVATIONS_Text_kjblc65q_ON_TAP');
                                                                    if (textCount ==
                                                                        1) {
                                                                      return;
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Text_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Review',
                                                                      queryParams:
                                                                          {
                                                                        'classRef':
                                                                            serializeParam(
                                                                          containerClassAvailableTimeSlotsRecord
                                                                              .classRef,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'reservationRef':
                                                                            serializeParam(
                                                                          myReservationsItem
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    textCount ==
                                                                            1
                                                                        ? '리뷰 작성 완료! :)'
                                                                        : '리뷰 작성하기',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Pretendard',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                ),
                                                if (functions.differenceInHours(
                                                        getCurrentTimestamp,
                                                        myReservationsItem
                                                            .startTime!) <
                                                    containerClassAvailableTimeSlotsRecord
                                                        .minHoursToCancel)
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
                                                                SpinKitWanderingCubes(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              'MY_RESERVATIONS_Icon_191q7v97_ON_TAP');
                                                          if (functions.differenceInHours(
                                                                  getCurrentTimestamp,
                                                                  myReservationsItem
                                                                      .startTime!) <
                                                              containerClassAvailableTimeSlotsRecord
                                                                  .minHoursToCancel) {
                                                            logFirebaseEvent(
                                                                'Icon_alert_dialog');
                                                            await showDialog(
                                                              context: context,
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
                                                                        title: Text(
                                                                            '예약을 취소하시겠습니까?'),
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
                                                                                Text('예'),
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
                                                          await myReservationsItem
                                                              .reference
                                                              .delete();
                                                          // Increment credits
                                                          logFirebaseEvent(
                                                              'Icon_Incrementcredits');

                                                          final usersUpdateData =
                                                              {
                                                            'currCredits': FieldValue
                                                                .increment(valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.currCredits,
                                                                    0)),
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
                                                          logFirebaseEvent(
                                                              'Icon_trigger_push_notification');
                                                          triggerPushNotification(
                                                            notificationTitle:
                                                                '${myReservationsItem.className} 예약취소',
                                                            notificationText:
                                                                '${dateTimeFormat(
                                                              'M/d h:mm a',
                                                              myReservationsItem
                                                                  .startTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )} - ${currentUserDisplayName}',
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
                                                              'Cancel - ${myReservationsItem.className}');
                                                        },
                                                        child: Icon(
                                                          Icons.cancel_outlined,
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
                                          ),
                                        );
                                      },
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
            ),
          ),
        );
      },
    );
  }
}
