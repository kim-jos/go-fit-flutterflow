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

class ConfirmationCancelWidget extends StatefulWidget {
  const ConfirmationCancelWidget({
    Key? key,
    this.className,
    this.date,
    this.time,
    this.reservationsRef,
    this.classRef,
    this.creditsRequired,
    this.timeSlotRef,
    this.chatRef,
  }) : super(key: key);

  final String? className;
  final String? date;
  final String? time;
  final DocumentReference? reservationsRef;
  final DocumentReference? classRef;
  final int? creditsRequired;
  final DocumentReference? timeSlotRef;
  final DocumentReference? chatRef;

  @override
  _ConfirmationCancelWidgetState createState() =>
      _ConfirmationCancelWidgetState();
}

class _ConfirmationCancelWidgetState extends State<ConfirmationCancelWidget> {
  ChatsRecord? groupChat;

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
      child: FutureBuilder<ChatsRecord>(
        future: ChatsRecord.getDocumentOnce(widget.chatRef!),
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
          final checkoutBottomSheetChatsRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
            ),
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
                                'yf2s0tw9' /* 예약을 취소하시겠습니까? */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
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
                                  valueOrDefault<String>(
                                    widget.date,
                                    '00/00/00',
                                  ),
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                              ],
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.creditsRequired?.toString(),
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.time,
                                '-',
                              ),
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

                            final reservationsUpdateData =
                                createReservationsRecordData(
                              date: widget.date,
                              timeSlot: widget.timeSlotRef,
                              user: currentUserReference,
                              isCancelled: false,
                              classRequiredCredits: widget.creditsRequired,
                              className: widget.className,
                            );
                            await widget.reservationsRef!
                                .update(reservationsUpdateData);
                            groupChat =
                                await FFChatManager.instance.removeGroupMembers(
                              checkoutBottomSheetChatsRecord,
                              [currentUserReference!],
                            );
                            // Increment credits

                            final usersUpdateData = {
                              'currCredits':
                                  FieldValue.increment(widget.creditsRequired!),
                            };
                            await currentUserReference!.update(usersUpdateData);
                            Navigator.pop(context);

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'u55jruvs' /* 취소하기 */,
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
          );
        },
      ),
    );
  }
}
