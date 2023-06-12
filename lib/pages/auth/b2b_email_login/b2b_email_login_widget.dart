import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'b2b_email_login_model.dart';
export 'b2b_email_login_model.dart';

class B2bEmailLoginWidget extends StatefulWidget {
  const B2bEmailLoginWidget({Key? key}) : super(key: key);

  @override
  _B2bEmailLoginWidgetState createState() => _B2bEmailLoginWidgetState();
}

class _B2bEmailLoginWidgetState extends State<B2bEmailLoginWidget> {
  late B2bEmailLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => B2bEmailLoginModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'B2bEmailLogin'});
    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.nameCreateController ??= TextEditingController();
    _model.emailAddressCreateController ??= TextEditingController();
    _model.passwordCreateController ??= TextEditingController();
    _model.passwordConfirmCreateController ??= TextEditingController();
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

    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.where('admin', isEqualTo: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).white,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        List<UsersRecord> b2bEmailLoginUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).white,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                '기업회원',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 60.0),
                      child: Text(
                        'Go Fit',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Pretendard',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                      ),
                    ),
                    StreamBuilder<List<CompaniesRecord>>(
                      stream: queryCompaniesRecord(),
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
                        List<CompaniesRecord> containerCompaniesRecordList =
                            snapshot.data!;
                        return Container(
                          width: 100.0,
                          constraints: BoxConstraints(
                            maxHeight: 650.0,
                          ),
                          decoration: BoxDecoration(),
                          child: DefaultTabController(
                            length: 2,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    isScrollable: true,
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    indicatorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    tabs: [
                                      Tab(
                                        text: '기업회원 로그인',
                                      ),
                                      Tab(
                                        text: '기업회원 회원가입',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .emailAddressController,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.emailAddressController',
                                                  Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  hintText: '이메일',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              20.0, 24.0),
                                                  suffixIcon: _model
                                                          .emailAddressController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .emailAddressController
                                                                ?.clear();
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: Color(
                                                                0xFF757575),
                                                            size: 22.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Pretendard',
                                                      color: Color(0xFF0F1113),
                                                      useGoogleFonts: false,
                                                    ),
                                                maxLines: null,
                                                validator: _model
                                                    .emailAddressControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.passwordController,
                                                obscureText:
                                                    !_model.passwordVisibility,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  hintText: '비밀번호',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              20.0, 24.0),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => _model
                                                              .passwordVisibility =
                                                          !_model
                                                              .passwordVisibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.passwordVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Pretendard',
                                                      color: Color(0xFF0F1113),
                                                      useGoogleFonts: false,
                                                    ),
                                                validator: _model
                                                    .passwordControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'B2B_EMAIL_LOGIN_PAGE_Button-Login_ON_TAP');
                                                  if (!functions.emailValidator(
                                                      _model.companyEmail!,
                                                      _model
                                                          .emailAddressController
                                                          .text)) {
                                                    logFirebaseEvent(
                                                        'Button-Login_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              '회사 이메일로 로그인 해주세요'),
                                                          content: Text(
                                                              '${_model.companyEmail} 이메일 사용해주세요'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('확인'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    return;
                                                  }
                                                  logFirebaseEvent(
                                                      'Button-Login_auth');
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();

                                                  final user = await authManager
                                                      .signInWithEmail(
                                                    context,
                                                    _model
                                                        .emailAddressController
                                                        .text,
                                                    _model.passwordController
                                                        .text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  logFirebaseEvent(
                                                      'Button-Login_navigate_to');

                                                  context.pushNamedAuth(
                                                      'Home', context.mounted);

                                                  logFirebaseEvent(
                                                      'Button-Login_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'New Email Login',
                                                    notificationText:
                                                        currentUserEmail,
                                                    userRefs:
                                                        b2bEmailLoginUsersRecordList
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                    initialPageName: 'Classes',
                                                    parameterData: {},
                                                  );
                                                  logFirebaseEvent(
                                                      'Button-Login_navigate_to');

                                                  context.pushNamedAuth(
                                                      'B2bPhoneNumber',
                                                      context.mounted);

                                                  logFirebaseEvent(
                                                      'Button-Login_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        '${_model.nameCreateController.text} 회원가입',
                                                    notificationText: _model
                                                        .emailAddressController
                                                        .text,
                                                    userRefs:
                                                        b2bEmailLoginUsersRecordList
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                    initialPageName: 'Home',
                                                    parameterData: {},
                                                  );
                                                },
                                                text: '로그인',
                                                options: FFButtonOptions(
                                                  width: 230.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Pretendard',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'B2B_EMAIL_LOGIN_Button-ForgotPassword_ON');
                                                  logFirebaseEvent(
                                                      'Button-ForgotPassword_alert_dialog');
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '비밀번호를 초기화'),
                                                                content: Text(
                                                                    '이메일 비밀번호를 초기화 하시겠습니까?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        '아니요'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
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
                                                  if (confirmDialogResponse) {
                                                    logFirebaseEvent(
                                                        'Button-ForgotPassword_auth');
                                                    if (_model
                                                        .emailAddressController
                                                        .text
                                                        .isEmpty) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Email required!',
                                                          ),
                                                        ),
                                                      );
                                                      return;
                                                    }
                                                    await authManager
                                                        .resetPassword(
                                                      email: _model
                                                          .emailAddressController
                                                          .text,
                                                      context: context,
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button-ForgotPassword_close_dialog,_draw');
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                text: '비밀번호 찾기',
                                                options: FFButtonOptions(
                                                  width: 170.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Colors.transparent,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium,
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'B2B_EMAIL_LOGIN_Button-ViewFirst_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button-ViewFirst_navigate_to');

                                                  context.pushNamed('Home');

                                                  logFirebaseEvent(
                                                      'Button-ViewFirst_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'AuthEmailLogin - 둘러보기');
                                                },
                                                text: '둘러보기',
                                                options: FFButtonOptions(
                                                  width: 170.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Colors.transparent,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium,
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'B2B_EMAIL_LOGIN_Button-ForgotPassword_ON');
                                                  logFirebaseEvent(
                                                      'Button-ForgotPassword_navigate_to');

                                                  context.pushNamed('snsLogin');
                                                },
                                                text: '개인회원 로그인',
                                                options: FFButtonOptions(
                                                  width: 170.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Colors.transparent,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.always,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .dropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        containerCompaniesRecordList
                                                            .map((e) => e.name)
                                                            .toList(),
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                          .dropDownValue = val);
                                                      logFirebaseEvent(
                                                          'B2B_EMAIL_LOGIN_DropDown_vhg8engl_ON_FOR');
                                                      logFirebaseEvent(
                                                          'DropDown_update_widget_state');
                                                      setState(() {
                                                        _model.companyEmail =
                                                            containerCompaniesRecordList
                                                                .where((e) =>
                                                                    _model
                                                                        .dropDownValue ==
                                                                    e.name)
                                                                .toList()
                                                                .first
                                                                .email;
                                                      });
                                                    },
                                                    width: 300.0,
                                                    height: 50.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium,
                                                    hintText: '내 회사 선택',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                20.0,
                                                                20.0,
                                                                0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .nameCreateController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.nameCreateController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: '이름',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                        suffixIcon: _model
                                                                .nameCreateController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .nameCreateController
                                                                      ?.clear();
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: Color(
                                                                    0xFF0F1113),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      maxLines: null,
                                                      validator: _model
                                                          .nameCreateControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                12.0,
                                                                20.0,
                                                                0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailAddressCreateController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.emailAddressCreateController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: '회사 이메일',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                        suffixIcon: _model
                                                                .emailAddressCreateController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .emailAddressCreateController
                                                                      ?.clear();
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: Color(
                                                                    0xFF0F1113),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      maxLines: null,
                                                      validator: _model
                                                          .emailAddressCreateControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                12.0,
                                                                20.0,
                                                                0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordCreateController,
                                                      obscureText: !_model
                                                          .passwordCreateVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText: '비밀번호',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model
                                                                    .passwordCreateVisibility =
                                                                !_model
                                                                    .passwordCreateVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.passwordCreateVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: Color(
                                                                    0xFF0F1113),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      validator: _model
                                                          .passwordCreateControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                12.0,
                                                                20.0,
                                                                0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .passwordConfirmCreateController,
                                                      obscureText: !_model
                                                          .passwordConfirmCreateVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        hintText: '비밀번호 확인',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => _model
                                                                    .passwordConfirmCreateVisibility =
                                                                !_model
                                                                    .passwordConfirmCreateVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.passwordConfirmCreateVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: Color(
                                                                    0xFF0F1113),
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      validator: _model
                                                          .passwordConfirmCreateControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'B2B_EMAIL_LOGIN_PAGE_Button-Login_ON_TAP');
                                                        if (!(_model.dropDownValue !=
                                                                null &&
                                                            _model.dropDownValue !=
                                                                '')) {
                                                          logFirebaseEvent(
                                                              'Button-Login_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '회사 선택해주세요!'),
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
                                                        if (!functions.emailValidator(
                                                            _model
                                                                .companyEmail!,
                                                            _model
                                                                .emailAddressCreateController
                                                                .text)) {
                                                          logFirebaseEvent(
                                                              'Button-Login_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '회사 이메일로 로그인 해주세요'),
                                                                content: Text(
                                                                    '${_model.companyEmail} 이메일 사용해주세요'),
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
                                                        logFirebaseEvent(
                                                            'Button-Login_auth');
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();
                                                        if (_model
                                                                .passwordCreateController
                                                                .text !=
                                                            _model
                                                                .passwordConfirmCreateController
                                                                .text) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Passwords don\'t match!',
                                                              ),
                                                            ),
                                                          );
                                                          return;
                                                        }

                                                        final user =
                                                            await authManager
                                                                .createAccountWithEmail(
                                                          context,
                                                          _model
                                                              .emailAddressCreateController
                                                              .text,
                                                          _model
                                                              .passwordCreateController
                                                              .text,
                                                        );
                                                        if (user == null) {
                                                          return;
                                                        }

                                                        logFirebaseEvent(
                                                            'Button-Login_auth');
                                                        await authManager
                                                            .sendEmailVerification();
                                                        logFirebaseEvent(
                                                            'Button-Login_backend_call');

                                                        final usersUpdateData =
                                                            createUsersRecordData(
                                                          b2bType: containerCompaniesRecordList
                                                              .where((e) =>
                                                                  e.name ==
                                                                  _model
                                                                      .dropDownValue)
                                                              .toList()
                                                              .first
                                                              .membershipType,
                                                          companyRef:
                                                              containerCompaniesRecordList
                                                                  .where((e) =>
                                                                      e.name ==
                                                                      _model
                                                                          .dropDownValue)
                                                                  .toList()
                                                                  .first
                                                                  .reference,
                                                        );
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData);
                                                        logFirebaseEvent(
                                                            'Button-Login_navigate_to');

                                                        context.pushNamedAuth(
                                                            'B2bPhoneNumber',
                                                            context.mounted);

                                                        logFirebaseEvent(
                                                            'Button-Login_trigger_push_notification');
                                                        triggerPushNotification(
                                                          notificationTitle:
                                                              '${_model.nameCreateController.text} 회원가입',
                                                          notificationText: _model
                                                              .emailAddressController
                                                              .text,
                                                          userRefs:
                                                              b2bEmailLoginUsersRecordList
                                                                  .map((e) => e
                                                                      .reference)
                                                                  .toList(),
                                                          initialPageName:
                                                              'Home',
                                                          parameterData: {},
                                                        );
                                                      },
                                                      text: '회원가입',
                                                      options: FFButtonOptions(
                                                        width: 230.0,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: Colors.white,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Pretendard',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'B2B_EMAIL_LOGIN_Button-ForgotPassword_ON');
                                                        logFirebaseEvent(
                                                            'Button-ForgotPassword_navigate_to');

                                                        context.pushNamed(
                                                            'snsLogin');
                                                      },
                                                      text: '개인회원으로 로그인',
                                                      options: FFButtonOptions(
                                                        width: 170.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Colors.transparent,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
