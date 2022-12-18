import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthLoginWidget extends StatefulWidget {
  const AuthLoginWidget({Key? key}) : super(key: key);

  @override
  _AuthLoginWidgetState createState() => _AuthLoginWidgetState();
}

class _AuthLoginWidgetState extends State<AuthLoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 60),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '196371zp' /* Go Fit */,
                      ),
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Jalnan',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 50,
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
                        labelColor: FlutterFlowTheme.of(context).primaryBtnText,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        labelStyle:
                            FlutterFlowTheme.of(context).subtitle1.override(
                                  fontFamily: 'Jalnan',
                                  useGoogleFonts: false,
                                ),
                        indicatorColor:
                            FlutterFlowTheme.of(context).primaryBtnText,
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
                                  24, 24, 24, 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 44,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'hcqp4p7i' /* Sign in with Google */,
                                              ),
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.transparent,
                                                size: 20,
                                              ),
                                              options: FFButtonOptions(
                                                width: 230,
                                                height: 44,
                                                color: Colors.white,
                                                textStyle: GoogleFonts.getFont(
                                                  'Roboto',
                                                  color: Color(0xFF606060),
                                                  fontSize: 17,
                                                ),
                                                elevation: 4,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.8, 0),
                                            child: Container(
                                              width: 22,
                                              height: 22,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();
                                                final user =
                                                    await signInWithGoogle(
                                                        context);
                                                if (user == null) {
                                                  return;
                                                }

                                                context.goNamedAuth(
                                                    'Classes', mounted);
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qwglaxrp' /* 구글 */,
                                              ),
                                              icon: FaIcon(
                                                FontAwesomeIcons.google,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray600,
                                                size: 20,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 50,
                                                color: Colors.white,
                                                textStyle: GoogleFonts.getFont(
                                                  'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                ),
                                                elevation: 4,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0,
                                                ),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              final user =
                                                  await signInWithApple(
                                                      context);
                                              if (user == null) {
                                                return;
                                              }

                                              context.goNamedAuth(
                                                  'Classes', mounted);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'zwoheq92' /* 애플 */,
                                            ),
                                            icon: FaIcon(
                                              FontAwesomeIcons.apple,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                              size: 20,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              textStyle: GoogleFonts.getFont(
                                                'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                              ),
                                              elevation: 4,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('AuthEmailLogin');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'f2xay9l9' /* 이메일 */,
                                      ),
                                      icon: Icon(
                                        Icons.email,
                                        color: FlutterFlowTheme.of(context)
                                            .black600,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50,
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 17,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Container(
                                      width: 227.1,
                                      height: 54.2,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('Classes');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '4scdlrn6' /* 먼저 둘러보기 */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        final user =
                                            await signInWithGoogle(context);
                                        if (user == null) {
                                          return;
                                        }

                                        context.goNamedAuth('Classes', mounted);
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'sh0xuws4' /* 구글 */,
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: FlutterFlowTheme.of(context)
                                            .black600,
                                        size: 20,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50,
                                        color: Colors.white,
                                        textStyle: GoogleFonts.getFont(
                                          'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                        elevation: 4,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  isAndroid
                                      ? Container()
                                      : Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              final user =
                                                  await signInWithApple(
                                                      context);
                                              if (user == null) {
                                                return;
                                              }

                                              context.goNamedAuth(
                                                  'Classes', mounted);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'd33hhv9s' /* 애플 */,
                                            ),
                                            icon: FaIcon(
                                              FontAwesomeIcons.apple,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black600,
                                              size: 20,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50,
                                              color: Colors.white,
                                              textStyle: GoogleFonts.getFont(
                                                'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                              ),
                                              elevation: 4,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('AuthEmailLogin');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'd3532eyn' /* 이메일 */,
                                      ),
                                      icon: Icon(
                                        Icons.email,
                                        color: FlutterFlowTheme.of(context)
                                            .black600,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50,
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 17,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
