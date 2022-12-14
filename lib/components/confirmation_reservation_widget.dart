import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmationReservationWidget extends StatefulWidget {
  const ConfirmationReservationWidget({
    Key? key,
    this.className,
    this.selectedDate,
    this.selectedTime,
    this.classRef,
    this.selectedTimeSlot,
    this.chatGroupRef,
  }) : super(key: key);

  final String? className;
  final DateTime? selectedDate;
  final String? selectedTime;
  final DocumentReference? classRef;
  final DocumentReference? selectedTimeSlot;
  final ChatsRecord? chatGroupRef;

  @override
  _ConfirmationReservationWidgetState createState() =>
      _ConfirmationReservationWidgetState();
}

class _ConfirmationReservationWidgetState
    extends State<ConfirmationReservationWidget> {
  ChatsRecord? groupChat;
  ReservationsRecord? newReservation;

  @override
  void initState() {
    super.initState();

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  widget.className!,
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Divider(
                height: 24,
                thickness: 2,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'cixwrkmj' /* 예약을 진행하시겠습니까? */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              dateTimeFormat(
                                'yMd',
                                FFAppState().selectedDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ],
                        ),
                        Text(
                          FFAppState().selectedTime,
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // reservations collection

                        final reservationsCreateData =
                            createReservationsRecordData(
                          date: dateTimeFormat(
                            'd/M/y',
                            widget.selectedDate,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          timeSlot: widget.selectedTimeSlot,
                          user: currentUserReference,
                        );
                        var reservationsRecordReference =
                            ReservationsRecord.collection.doc();
                        await reservationsRecordReference
                            .set(reservationsCreateData);
                        newReservation = ReservationsRecord.getDocumentFromData(
                            reservationsCreateData,
                            reservationsRecordReference);
                        groupChat =
                            await FFChatManager.instance.addGroupMembers(
                          widget.chatGroupRef!,
                          [currentUserReference!],
                        );
                        // myReservations collection

                        final myReservationsCreateData =
                            createMyReservationsRecordData(
                          date: FFAppState().selectedDate,
                          time: FFAppState().selectedTime,
                          className: widget.className,
                          reservationsRef: newReservation!.reference,
                          status: 'reserved',
                          classRequiredCredits: FFAppState().creditsRequired,
                        );
                        await MyReservationsRecord.createDoc(
                                currentUserReference!)
                            .set(myReservationsCreateData);
                        // Decrement currCredits

                        final usersUpdateData = {
                          'currCredits': FieldValue.increment(
                              -(FFAppState().creditsRequired)),
                        };
                        await currentUserReference!.update(usersUpdateData);

                        context.goNamed('ReservationComplete');

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '7q84xuov' /* 예약하기 */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
