import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/confirmation_reservation_widget.dart';
import '../components/no_time_slots_available_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  DateTimeRange? calendarSelectedDay;

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x25090F13),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3xgaq3lj' /* 수업 예약 */,
                  ),
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '4ldfd1n9' /* 날짜/시간 선택 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ),
              Divider(
                height: 24,
                thickness: 2,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).primaryColor,
                weekFormat: false,
                weekStartsMonday: false,
                initialDate: getCurrentTimestamp,
                onChange: (DateTimeRange? newSelectedDate) async {
                  calendarSelectedDay = newSelectedDate;
                  setState(() {
                    FFAppState().selectedDate = calendarSelectedDay?.start;
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
                  queryBuilder: (reservationsRecord) =>
                      reservationsRecord.where('date',
                          isEqualTo: dateTimeFormat(
                                    'd/M/y',
                                    calendarSelectedDay?.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) !=
                                  ''
                              ? dateTimeFormat(
                                  'd/M/y',
                                  calendarSelectedDay?.start,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )
                              : null),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<ReservationsRecord> containerReservationsRecordList =
                      snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: StreamBuilder<List<ClassAvailableTimeSlotsRecord>>(
                      stream: queryClassAvailableTimeSlotsRecord(
                        queryBuilder: (classAvailableTimeSlotsRecord) =>
                            classAvailableTimeSlotsRecord
                                .where('weekdays',
                                    arrayContains: dateTimeFormat(
                                              'EEEE',
                                              FFAppState().selectedDate,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) !=
                                            ''
                                        ? dateTimeFormat(
                                            'EEEE',
                                            FFAppState().selectedDate,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                        : null)
                                .where('classRef', isEqualTo: widget.classRef),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              rowClassAvailableTimeSlotsRecordList.length,
                              (rowIndex) {
                            final rowClassAvailableTimeSlotsRecord =
                                rowClassAvailableTimeSlotsRecordList[rowIndex];
                            return Visibility(
                              visible: (containerReservationsRecordList.length <
                                      rowClassAvailableTimeSlotsRecord
                                          .maxLimit!) &&
                                  (functions.differenceInHours(
                                          getCurrentTimestamp,
                                          functions.dateTimeParser(
                                              rowClassAvailableTimeSlotsRecord
                                                  .startTime!,
                                              calendarSelectedDay!.start)) >
                                      rowClassAvailableTimeSlotsRecord
                                          .minHoursBeforeClass!) &&
                                  (functions.differenceInHours(
                                          getCurrentTimestamp,
                                          functions.dateTimeParser(
                                              rowClassAvailableTimeSlotsRecord
                                                  .startTime!,
                                              calendarSelectedDay!.start)) <
                                      rowClassAvailableTimeSlotsRecord
                                          .maxHoursBeforeClass!) &&
                                  (containerReservationsRecordList
                                          .where((e) =>
                                              e.user! == currentUserReference)
                                          .toList()
                                          .length <
                                      1),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().selectedTime =
                                        rowClassAvailableTimeSlotsRecord
                                            .startTime!;
                                  });
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: ConfirmationReservationWidget(
                                            className: widget.className,
                                            selectedDate:
                                                calendarSelectedDay?.start,
                                            selectedTime:
                                                FFAppState().selectedTime,
                                            classRef: widget.classRef,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text:
                                    rowClassAvailableTimeSlotsRecord.startTime!,
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  );
                },
              ),
              Divider(
                height: 24,
                thickness: 2,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Container(
                width: double.infinity,
                height: 45,
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'fitnbi1b' /* 닫기 */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
