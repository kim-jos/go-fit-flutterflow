import '/auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/components/home_page_promotion/home_page_promotion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

    return StreamBuilder<List<DiscoveryRecord>>(
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
        List<DiscoveryRecord> homeDiscoveryRecordList = snapshot.data!;
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
                        StreamBuilder<List<DiscoveryRecord>>(
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
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowDiscoveryRecordList.length, (rowIndex) {
                                final rowDiscoveryRecord =
                                    rowDiscoveryRecordList[rowIndex];
                                return InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_Image_6wv5o153_ON_TAP');
                                    logFirebaseEvent('Image_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x00000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (bottomSheetContext) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              child: HomePagePromotionWidget(
                                                contentUrls: rowDiscoveryRecord
                                                    .contentUrl!
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: rowDiscoveryRecord.thumbnailUrl!,
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 350.0,
                                    fit: BoxFit.cover,
                                  ),
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
                              'ur5tuu56' /* 인기 수업 */,
                            ),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                          List<ClassesRecord> rowClassesRecordList =
                              snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                  rowClassesRecordList.length, (rowIndex) {
                                final rowClassesRecord =
                                    rowClassesRecordList[rowIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_Stack_z1cwstb0_ON_TAP');
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
                                          -0.44999999999999996,
                                          0.6000000000000001),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.5),
                                                child: AutoSizeText(
                                                  rowClassesRecord.name!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Pretendard',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.5),
                                                child: AutoSizeText(
                                                  rowClassesRecord
                                                      .exerciseType!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Pretendard',
                                                        color:
                                                            FlutterFlowTheme.of(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
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
