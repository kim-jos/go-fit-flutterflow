import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirmation_reservation/confirmation_reservation_widget.dart';
import '/components/no_time_slots_available/no_time_slots_available_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reservation_model.dart';
export 'reservation_model.dart';

class ReservationWidget extends StatefulWidget {
  const ReservationWidget({
    Key? key,
    this.classRef,
    this.className,
    this.maxLimit,
  }) : super(key: key);

  final DocumentReference? classRef;
  final String? className;
  final int? maxLimit;

  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  late ReservationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReservationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Text(
                  '수업 예약',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  '날짜/시간 선택',
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primary,
                weekFormat: true,
                weekStartsMonday: false,
                initialDate: getCurrentTimestamp,
                onChange: (DateTimeRange? newSelectedDate) async {
                  _model.calendarSelectedDay = newSelectedDate;
                  logFirebaseEvent('RESERVATION_Calendar_s9g34vcw_ON_DATE_SE');
                  logFirebaseEvent('Calendar_update_app_state');
                  FFAppState().update(() {
                    FFAppState().selectedDate =
                        _model.calendarSelectedDay?.start;
                  });
                  setState(() {});
                },
                titleStyle: TextStyle(),
                dayOfWeekStyle: TextStyle(),
                dateStyle: TextStyle(),
                selectedDateStyle: TextStyle(),
                inactiveDateStyle: TextStyle(),
                locale: FFLocalizations.of(context).languageCode,
              ),
              StreamBuilder<List<ReservationsRecord>>(
                stream: queryReservationsRecord(
                  queryBuilder: (reservationsRecord) => reservationsRecord
                      .where('date',
                          isEqualTo: dateTimeFormat(
                                    'yMd',
                                    _model.calendarSelectedDay?.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) !=
                                  ''
                              ? dateTimeFormat(
                                  'yMd',
                                  _model.calendarSelectedDay?.start,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )
                              : null)
                      .where('className',
                          isEqualTo:
                              widget.className != '' ? widget.className : null)
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
                  List<ReservationsRecord> containerReservationsRecordList =
                      snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: StreamBuilder<List<ClassAvailableTimeSlotsRecord>>(
                      stream: queryClassAvailableTimeSlotsRecord(
                        queryBuilder: (classAvailableTimeSlotsRecord) =>
                            classAvailableTimeSlotsRecord
                                .where('weekdays',
                                    arrayContains:
                                        functions.convertWeekDayToInteger(
                                            _model.calendarSelectedDay!.start))
                                .where('classRef', isEqualTo: widget.classRef)
                                .orderBy('startTime'),
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
                        List<ClassAvailableTimeSlotsRecord>
                            rowClassAvailableTimeSlotsRecordList =
                            snapshot.data!;
                        if (rowClassAvailableTimeSlotsRecordList.isEmpty) {
                          return Center(
                            child: NoTimeSlotsAvailableWidget(),
                          );
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                rowClassAvailableTimeSlotsRecordList.length,
                                (rowIndex) {
                              final rowClassAvailableTimeSlotsRecord =
                                  rowClassAvailableTimeSlotsRecordList[
                                      rowIndex];
                              return Visibility(
                                visible: (containerReservationsRecordList
                                            .length <
                                        rowClassAvailableTimeSlotsRecord
                                            .maxLimit!) &&
                                    (functions.differenceInHours(
                                            getCurrentTimestamp,
                                            functions.dateTimeParser(
                                                rowClassAvailableTimeSlotsRecord
                                                    .startTime!,
                                                _model.calendarSelectedDay!
                                                    .start)) >
                                        rowClassAvailableTimeSlotsRecord
                                            .minHoursBeforeClass!) &&
                                    (functions.differenceInHours(
                                            getCurrentTimestamp,
                                            functions.dateTimeParser(
                                                rowClassAvailableTimeSlotsRecord
                                                    .startTime!,
                                                _model.calendarSelectedDay!
                                                    .start)) <
                                        rowClassAvailableTimeSlotsRecord
                                            .maxHoursBeforeClass!) &&
                                    (containerReservationsRecordList
                                            .where((e) =>
                                                e.time ==
                                                rowClassAvailableTimeSlotsRecord
                                                    .startTime)
                                            .toList()
                                            .length <
                                        1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 7.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'RESERVATION_COMP_BUTTON_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().selectedTime =
                                            rowClassAvailableTimeSlotsRecord
                                                .startTime!;
                                      });
                                      logFirebaseEvent('Button_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return Padding(
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child:
                                                  ConfirmationReservationWidget(
                                                className: widget.className,
                                                selectedDate: _model
                                                    .calendarSelectedDay?.start,
                                                selectedTime:
                                                    FFAppState().selectedTime,
                                                classRef: widget.classRef,
                                                selectedTimeSlot:
                                                    rowClassAvailableTimeSlotsRecord
                                                        .reference,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    text: rowClassAvailableTimeSlotsRecord
                                                .startTime ==
                                            '22:30'
                                        ? '종일권'
                                        : rowClassAvailableTimeSlotsRecord
                                            .startTime!,
                                    options: FFButtonOptions(
                                      width: 130.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Pretendard',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Container(
                width: double.infinity,
                height: 45.0,
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('RESERVATION_COMP_닫기_BTN_ON_TAP');
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: '닫기',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Pretendard',
                          color: Colors.white,
                          useGoogleFonts: false,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
