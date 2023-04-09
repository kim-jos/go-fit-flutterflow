import '/auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'j5e1hdhm' /* Go Fit */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Pretendard',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<HomeRecord>>(
                      stream: queryHomeRecord(),
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
                        List<HomeRecord> rowHomeRecordList = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(rowHomeRecordList.length,
                              (rowIndex) {
                            final rowHomeRecord = rowHomeRecordList[rowIndex];
                            return FlutterFlowVideoPlayer(
                              path: rowHomeRecord.videoUrl!,
                              videoType: VideoType.network,
                              autoPlay: true,
                              looping: true,
                              showControls: false,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                              lazyLoad: true,
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ur5tuu56' /* 공지사항 */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: StreamBuilder<List<DiscoveryRecord>>(
                    stream: queryDiscoveryRecord(),
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
                      List<DiscoveryRecord> rowDiscoveryRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(rowDiscoveryRecordList.length,
                              (rowIndex) {
                            final rowDiscoveryRecord =
                                rowDiscoveryRecordList[rowIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Stack(
                                alignment: AlignmentDirectional(-0.8, 0.5),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            rowDiscoveryRecord.thumbnailUrl!,
                                        width: 150.0,
                                        height: 160.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 150.0,
                                      height: 160.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x62090F13),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.16, 0.51),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.3),
                                          child: AutoSizeText(
                                            rowDiscoveryRecord.title!,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'mj97gh4q' /* 인기 수업 */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: StreamBuilder<List<ClassesRecord>>(
                    stream: queryClassesRecord(
                      queryBuilder: (classesRecord) => classesRecord
                          .where('isPopular', isEqualTo: true)
                          .where('hideClass', isEqualTo: false),
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
                      List<ClassesRecord> rowClassesRecordList = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(rowClassesRecordList.length,
                              (rowIndex) {
                            final rowClassesRecord =
                                rowClassesRecordList[rowIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOME_PAGE_Stack_nba54e2h_ON_TAP');
                                  logFirebaseEvent('Stack_navigate_to');

                                  context.pushNamed(
                                    'ClassDetails',
                                    queryParams: {
                                      'classRef': serializeParam(
                                        rowClassesRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'className': serializeParam(
                                        rowClassesRecord.name,
                                        ParamType.String,
                                      ),
                                      'exerciseType': serializeParam(
                                        rowClassesRecord.exerciseType,
                                        ParamType.String,
                                      ),
                                      'coords': serializeParam(
                                        rowClassesRecord.coords,
                                        ParamType.LatLng,
                                      ),
                                      'creditsRequired': serializeParam(
                                        rowClassesRecord.creditsRequired,
                                        ParamType.int,
                                      ),
                                      'paymentUrl': serializeParam(
                                        rowClassesRecord.paymentUrl,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  logFirebaseEvent(
                                      'Stack_google_analytics_event');
                                  logFirebaseEvent(
                                      'Home Page - ${rowClassesRecord.name}');
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional(
                                      -0.44999999999999996, 0.6000000000000001),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: CachedNetworkImage(
                                          imageUrl: rowClassesRecord.image!,
                                          width: 150.0,
                                          height: 160.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150.0,
                                      height: 160.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x62090F13),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.16, 0.51),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.5),
                                            child: AutoSizeText(
                                              rowClassesRecord.name!,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.5),
                                            child: AutoSizeText(
                                              rowClassesRecord.exerciseType!,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'arb368t6' /* 다른 수업 보기 */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<ClassesRecord>>(
                    stream: queryClassesRecord(
                      queryBuilder: (classesRecord) => classesRecord
                          .where('hideClass', isEqualTo: false)
                          .orderBy('priority'),
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
                      List<ClassesRecord> listViewClassesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewClassesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewClassesRecord =
                              listViewClassesRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              height: 90.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOME_PAGE_Row_6honob66_ON_TAP');
                                  logFirebaseEvent('Row_navigate_to');

                                  context.pushNamed(
                                    'ClassDetails',
                                    queryParams: {
                                      'classRef': serializeParam(
                                        listViewClassesRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'className': serializeParam(
                                        listViewClassesRecord.name,
                                        ParamType.String,
                                      ),
                                      'exerciseType': serializeParam(
                                        listViewClassesRecord.exerciseType,
                                        ParamType.String,
                                      ),
                                      'coords': serializeParam(
                                        listViewClassesRecord.coords,
                                        ParamType.LatLng,
                                      ),
                                      'creditsRequired': serializeParam(
                                        listViewClassesRecord.creditsRequired,
                                        ParamType.int,
                                      ),
                                      'paymentUrl': serializeParam(
                                        listViewClassesRecord.paymentUrl,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );

                                  logFirebaseEvent(
                                      'Row_google_analytics_event');
                                  logFirebaseEvent(
                                      'Home-${listViewClassesRecord.name}');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional(0.7, -0.75),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      listViewClassesRecord
                                                          .image!,
                                                  width: 74.0,
                                                  height: 74.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 1.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewClassesRecord.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewClassesRecord
                                                      .exerciseType!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Pretendard',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewClassesRecord
                                                      .distance!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Pretendard',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Icon(
                                              Icons.chevron_right_outlined,
                                              color: Color(0xFF95A1AC),
                                              size: 24.0,
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
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                ),
                if (loggedIn == false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_로그인_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('AuthLogin');
                      },
                      text: FFLocalizations.of(context).getText(
                        'i4li92hl' /* 로그인 */,
                      ),
                      options: FFButtonOptions(
                        width: 130.0,
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
