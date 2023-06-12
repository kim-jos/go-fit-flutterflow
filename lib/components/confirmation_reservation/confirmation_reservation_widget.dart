import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirmation_reservation_model.dart';
export 'confirmation_reservation_model.dart';

class ConfirmationReservationWidget extends StatefulWidget {
  const ConfirmationReservationWidget({
    Key? key,
    this.className,
    this.selectedDate,
    this.selectedTime,
    this.classRef,
    this.selectedTimeSlot,
    this.creditsRequired,
    this.paymentUrl,
  }) : super(key: key);

  final String? className;
  final DateTime? selectedDate;
  final String? selectedTime;
  final DocumentReference? classRef;
  final DocumentReference? selectedTimeSlot;
  final int? creditsRequired;
  final String? paymentUrl;

  @override
  _ConfirmationReservationWidgetState createState() =>
      _ConfirmationReservationWidgetState();
}

class _ConfirmationReservationWidgetState
    extends State<ConfirmationReservationWidget> {
  late ConfirmationReservationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationReservationModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.className} - ${formatNumber(
                          widget.creditsRequired,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        )}원',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 16.0, 5.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '예약을 진행하시겠습니까?',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 4.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '예약 취소는 24시간 전 까지만 가능합니다.',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 4.0, 5.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                dateTimeFormat(
                                  'yMMMd',
                                  FFAppState().selectedDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ],
                          ),
                          Text(
                            FFAppState().selectedTime,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => FutureBuilder<CompaniesRecord>(
                          future: CompaniesRecord.getDocumentOnce(
                              currentUserDocument!.companyRef!),
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
                            final buttonCompaniesRecord = snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CONFIRMATION_RESERVATION_예약하기_BTN_ON_TAP');
                                if (valueOrDefault(
                                        currentUserDocument?.b2bType, '') ==
                                    'team') {
                                  if (currentUserEmailVerified) {
                                    if (buttonCompaniesRecord
                                            .remainingCredits <=
                                        0) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('사용권 부족'),
                                            content: Text('사용권 추가 구매 후 사용해주세요'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('확인'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return;
                                    }
                                    // reservations collection
                                    logFirebaseEvent(
                                        'Button_reservationscollection');

                                    final reservationsCreateData1 = {
                                      ...createReservationsRecordData(
                                        date: dateTimeFormat(
                                          'yMd',
                                          widget.selectedDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        timeSlot: widget.selectedTimeSlot,
                                        user: currentUserReference,
                                        classRequiredCredits:
                                            widget.creditsRequired,
                                        className: widget.className,
                                        time: widget.selectedTime,
                                        isFinal: true,
                                        startTime: functions.dateTimeParser(
                                            widget.selectedTime!,
                                            widget.selectedDate!),
                                      ),
                                      'createdAt': FieldValue.serverTimestamp(),
                                    };
                                    await ReservationsRecord.collection
                                        .doc()
                                        .set(reservationsCreateData1);
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamed('ReservationComplete');

                                    logFirebaseEvent(
                                        'Button_google_analytics_event');
                                    logFirebaseEvent(
                                        'Confirm Reservation Widget - ${widget.className}');
                                    return;
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('이메일 인증 필요'),
                                          content: Text('이메일 인증 후 예약 가능합니다'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('확인'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }
                                }
                                if (valueOrDefault(
                                        currentUserDocument?.currCredits, 0) >=
                                    widget.creditsRequired!) {
                                  // reservations collection
                                  logFirebaseEvent(
                                      'Button_reservationscollection');

                                  final reservationsCreateData2 = {
                                    ...createReservationsRecordData(
                                      date: dateTimeFormat(
                                        'yMd',
                                        widget.selectedDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      timeSlot: widget.selectedTimeSlot,
                                      user: currentUserReference,
                                      classRequiredCredits:
                                          widget.creditsRequired,
                                      className: widget.className,
                                      time: widget.selectedTime,
                                      isFinal: true,
                                      startTime: functions.dateTimeParser(
                                          widget.selectedTime!,
                                          widget.selectedDate!),
                                    ),
                                    'createdAt': FieldValue.serverTimestamp(),
                                  };
                                  await ReservationsRecord.collection
                                      .doc()
                                      .set(reservationsCreateData2);
                                  // Decrement currCredits
                                  logFirebaseEvent(
                                      'Button_DecrementcurrCredits');

                                  final usersUpdateData = {
                                    'currCredits': FieldValue.increment(
                                        -(widget.creditsRequired!)),
                                  };
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed('ReservationComplete');

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent(
                                      'Confirm Reservation Widget - ${widget.className}');
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('포인트 부족'),
                                        content: Text('포인트 충천 후 사용해주세요!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('확인'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                              },
                              text: '예약하기',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Pretendard',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
