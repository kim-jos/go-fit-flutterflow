import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_number_model.dart';
export 'phone_number_model.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  _PhoneNumberWidgetState createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget>
    with TickerProviderStateMixin {
  late PhoneNumberModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneNumberModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PhoneNumber'});
    _model.phoneNumberController ??= TextEditingController();
    _model.referralCodeController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          '정보 입력',
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Text(
                      '수업예약에 문제가 있을 경우 문자로 연락을 드립니다!',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
            child: TextFormField(
              controller: _model.phoneNumberController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: '전화번호 입력해주세요',
                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Pretendard',
                    color: Color(0xFF0F1113),
                    useGoogleFonts: false,
                  ),
              maxLines: null,
              keyboardType: TextInputType.phone,
              validator:
                  _model.phoneNumberControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      '추천인 코드 입력하고 보상 받으세요!',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 5.0, 0.0),
                        child: TextFormField(
                          controller: _model.referralCodeController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '추천인 코드 입력해주세요',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Pretendard',
                                    color: Color(0xFF0F1113),
                                    useGoogleFonts: false,
                                  ),
                          maxLines: null,
                          keyboardType: TextInputType.phone,
                          validator: _model.referralCodeControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      if (_model.referrersCode != null)
                        Text(
                          '추천코드 확인됐습니다!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Pretendard',
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      if (FFAppState().didPressReferralVerification &&
                          (_model.referrersCode == null))
                        Text(
                          '유효하지 않은 추천코드입니다!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Pretendard',
                                    color: Color(0xFFFF0000),
                                    useGoogleFonts: false,
                                  ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: (_model.referrersCode != null) &&
                            FFAppState().didPressReferralVerification
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'PHONE_NUMBER_PAGE_VerifyReferrer_ON_TAP');
                            logFirebaseEvent('VerifyReferrer_custom_action');
                            _model.referrersCode =
                                await actions.doesReferralCodeExist(
                              _model.referralCodeController.text,
                            );
                            logFirebaseEvent('VerifyReferrer_update_app_state');
                            FFAppState().didPressReferralVerification = true;

                            setState(() {});
                          },
                    text: '추천인 확인',
                    options: FFButtonOptions(
                      width: 90.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Pretendard',
                                color: Colors.white,
                                useGoogleFonts: false,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      disabledColor: FlutterFlowTheme.of(context).accent1,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).primaryBtnText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('PHONE_NUMBER_PAGE_Button-Login_ON_TAP');
                if (_model.referrersCode != null) {
                  logFirebaseEvent('Button-Login_backend_call');

                  final usersUpdateData1 = createUsersRecordData(
                    phoneNumber: _model.phoneNumberController.text,
                    referralCode: random_data.randomString(
                      12,
                      12,
                      true,
                      true,
                      true,
                    ),
                    referralBy: _model.referrersCode?.id,
                    referralCount: 0,
                  );
                  await currentUserReference!.update(usersUpdateData1);
                  logFirebaseEvent('Button-Login_backend_call');

                  final usersUpdateData2 = {
                    'referralCount': FieldValue.increment(1),
                  };
                  await _model.referrersCode!.update(usersUpdateData2);
                  logFirebaseEvent('Button-Login_backend_call');

                  final referralsCreateData = createReferralsRecordData(
                    createdAt: getCurrentTimestamp,
                    referralBy: _model.referrersCode,
                    userRef: currentUserReference,
                  );
                  await ReferralsRecord.collection
                      .doc()
                      .set(referralsCreateData);
                } else {
                  logFirebaseEvent('Button-Login_backend_call');

                  final usersUpdateData3 = createUsersRecordData(
                    phoneNumber: _model.phoneNumberController.text,
                    referralCode: random_data.randomString(
                      12,
                      12,
                      true,
                      true,
                      true,
                    ),
                    referralCount: 0,
                  );
                  await currentUserReference!.update(usersUpdateData3);
                }

                logFirebaseEvent('Button-Login_navigate_to');

                context.pushNamed('Home');
              },
              text: '완료',
              options: FFButtonOptions(
                width: 230.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Pretendard',
                      color: Colors.white,
                      useGoogleFonts: false,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
