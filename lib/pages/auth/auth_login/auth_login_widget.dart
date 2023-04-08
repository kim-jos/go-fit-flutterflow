import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_login_model.dart';
export 'auth_login_model.dart';

class AuthLoginWidget extends StatefulWidget {
  const AuthLoginWidget({Key? key}) : super(key: key);

  @override
  _AuthLoginWidgetState createState() => _AuthLoginWidgetState();
}

class _AuthLoginWidgetState extends State<AuthLoginWidget> {
  late AuthLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthLoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AuthLogin'});
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

    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.where('admin', isEqualTo: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
              ),
            ),
          );
        }
        List<UsersRecord> authLoginUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 60.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '196371zp' /* Go Fit */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Pretendard',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).lineColor,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18.0,
                                  useGoogleFonts: false,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '9t8b8ezy' /* 로그인 */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'q34ek0kh' /* 회원가입 */,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 24.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'AUTH_LOGIN_PAGE_GOOGLE로_로그인_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_auth');
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    final user =
                                                        await signInWithGoogle(
                                                            context);
                                                    if (user == null) {
                                                      return;
                                                    }
                                                    if (currentPhoneNumber ==
                                                            null ||
                                                        currentPhoneNumber ==
                                                            '') {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamedAuth(
                                                          'AuthPhoneNumber',
                                                          mounted);
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamedAuth(
                                                          'Classes', mounted);
                                                    }

                                                    logFirebaseEvent(
                                                        'Button_trigger_push_notification');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'New Google Login',
                                                      notificationText:
                                                          currentUserEmail,
                                                      userRefs:
                                                          authLoginUsersRecordList
                                                              .map((e) =>
                                                                  e.reference)
                                                              .toList(),
                                                      initialPageName:
                                                          'Classes',
                                                      parameterData: {},
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'qwglaxrp' /* Google로 로그인 */,
                                                  ),
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.google,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray600,
                                                    size: 20.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    color: Colors.white,
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 17.0,
                                                    ),
                                                    elevation: 4.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      isAndroid
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'AUTH_LOGIN_PAGE_APPLE로_로그인_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_auth');
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  final user =
                                                      await signInWithApple(
                                                          context);
                                                  if (user == null) {
                                                    return;
                                                  }
                                                  if (currentPhoneNumber ==
                                                          null ||
                                                      currentPhoneNumber ==
                                                          '') {
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamedAuth(
                                                        'AuthPhoneNumber',
                                                        mounted);
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamedAuth(
                                                        'Classes', mounted);
                                                  }

                                                  logFirebaseEvent(
                                                      'Button_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        'New Apple Login',
                                                    notificationText:
                                                        currentUserEmail,
                                                    userRefs:
                                                        authLoginUsersRecordList
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                    initialPageName: 'Classes',
                                                    parameterData: {},
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'zwoheq92' /* Apple로 로그인 */,
                                                ),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.apple,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              10.0, 1.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17.0,
                                                  ),
                                                  elevation: 4.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUTH_LOGIN_PAGE_Text_rt975us3_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_navigate_to');

                                            context.pushNamed('AuthEmailLogin');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5ahve3qy' /* E-mail로 로그인 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUTH_LOGIN_PAGE_Text_jqlwr1xb_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_navigate_to');

                                            context.pushNamed('Classes');

                                            logFirebaseEvent(
                                                'Text_google_analytics_event');
                                            logFirebaseEvent(
                                                'AuthLogin - 둘러보기');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '94yrjtwq' /* 둘러보기 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
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
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'AUTH_LOGIN_PAGE_GOOGLE로_등록_BTN_ON_TAP');
                                            logFirebaseEvent('Button_auth');
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            final user =
                                                await signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'Button_trigger_push_notification');
                                            triggerPushNotification(
                                              notificationTitle:
                                                  '${currentUserDisplayName} 회원가입',
                                              notificationText:
                                                  currentUserEmail,
                                              userRefs: authLoginUsersRecordList
                                                  .map((e) => e.reference)
                                                  .toList(),
                                              initialPageName: 'Home',
                                              parameterData: {},
                                            );
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamedAuth(
                                                'AuthPhoneNumber', mounted);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'sh0xuws4' /* Google로 등록 */,
                                          ),
                                          icon: FaIcon(
                                            FontAwesomeIcons.google,
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            color: Colors.white,
                                            textStyle: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17.0,
                                            ),
                                            elevation: 4.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                      isAndroid
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'AUTH_LOGIN_PAGE_APPLE로_등록_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_auth');
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  final user =
                                                      await signInWithApple(
                                                          context);
                                                  if (user == null) {
                                                    return;
                                                  }
                                                  logFirebaseEvent(
                                                      'Button_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        '${currentUserDisplayName} 회원가입',
                                                    notificationText:
                                                        currentUserEmail,
                                                    userRefs:
                                                        authLoginUsersRecordList
                                                            .map((e) =>
                                                                e.reference)
                                                            .toList(),
                                                    initialPageName: 'Home',
                                                    parameterData: {},
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamedAuth(
                                                      'AuthPhoneNumber',
                                                      mounted);
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'd33hhv9s' /* Apple로 등록 */,
                                                ),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.apple,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 20.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              10.0, 1.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17.0,
                                                  ),
                                                  elevation: 4.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0x00101213),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUTH_LOGIN_PAGE_Text_yia8ibjg_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_navigate_to');

                                            context.pushNamed('AuthEmailLogin');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '8s89w6h0' /* E-mail로 등록 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
