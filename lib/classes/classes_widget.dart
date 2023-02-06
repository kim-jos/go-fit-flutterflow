import '../backend/backend.dart';
import '../components/class_list_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClassesWidget extends StatefulWidget {
  const ClassesWidget({Key? key}) : super(key: key);

  @override
  _ClassesWidgetState createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CLASSES_PAGE_Classes_ON_PAGE_LOAD');
      logFirebaseEvent('Classes_update_local_state');
      FFAppState().update(() {});
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Classes'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: SpinKitRing(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 40,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<ClassesRecord>>(
      stream: queryClassesRecord(
        queryBuilder: (classesRecord) => classesRecord.orderBy('priority'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitRing(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 40,
              ),
            ),
          );
        }
        List<ClassesRecord> classesClassesRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FlutterFlowGoogleMap(
                            controller: googleMapsController,
                            onCameraIdle: (latLng) => googleMapsCenter = latLng,
                            initialLocation: googleMapsCenter ??=
                                currentUserLocationValue!,
                            markers: classesClassesRecordList
                                .where((e) => e.hideClass == false)
                                .toList()
                                .map(
                                  (classesClassesRecord) => FlutterFlowMarker(
                                    classesClassesRecord.reference.path,
                                    classesClassesRecord.coords!,
                                    () async {
                                      logFirebaseEvent(
                                          'CLASSES_GoogleMap_b3v9l3nf_ON_MARKER_TAP');
                                      logFirebaseEvent(
                                          'GoogleMap_update_local_state');
                                      FFAppState().update(() {
                                        FFAppState().markerClassRef =
                                            classesClassesRecord.reference;
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.orange,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.01, 0.65),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CLASSES_PAGE_목록_보기_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_update_local_state');
                                        FFAppState().update(() {
                                          FFAppState().markerClassRef = null;
                                        });
                                        logFirebaseEvent('Button_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.8,
                                                child: ClassListWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: '목록 보기',
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().markerClassRef != null)
                                  Align(
                                    alignment: AlignmentDirectional(0, 0.95),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 1),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CLASSES_PAGE_ClassContainer_ON_TAP');
                                          logFirebaseEvent(
                                              'ClassContainer_navigate_to');

                                          context.pushNamed(
                                            'ClassDetails',
                                            queryParams: {
                                              'classRef': serializeParam(
                                                classesClassesRecordList
                                                    .where((e) =>
                                                        e.reference ==
                                                        FFAppState()
                                                            .markerClassRef)
                                                    .toList()
                                                    .first
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'className': serializeParam(
                                                classesClassesRecordList
                                                    .where((e) =>
                                                        e.reference ==
                                                        FFAppState()
                                                            .markerClassRef)
                                                    .toList()
                                                    .first
                                                    .name,
                                                ParamType.String,
                                              ),
                                              'exerciseType': serializeParam(
                                                classesClassesRecordList
                                                    .where((e) =>
                                                        e.reference ==
                                                        FFAppState()
                                                            .markerClassRef)
                                                    .toList()
                                                    .first
                                                    .exerciseType,
                                                ParamType.String,
                                              ),
                                              'image': serializeParam(
                                                classesClassesRecordList
                                                    .where((e) =>
                                                        e.reference ==
                                                        FFAppState()
                                                            .markerClassRef)
                                                    .toList()
                                                    .first
                                                    .image,
                                                ParamType.String,
                                              ),
                                              'creditsRequired': serializeParam(
                                                classesClassesRecordList
                                                    .where((e) =>
                                                        e.reference ==
                                                        FFAppState()
                                                            .markerClassRef)
                                                    .toList()
                                                    .first
                                                    .creditsRequired,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.7, -0.75),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 8, 8, 8),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: classesClassesRecordList
                                                                .where((e) =>
                                                                    e.reference ==
                                                                    FFAppState()
                                                                        .markerClassRef)
                                                                .toList()
                                                                .first
                                                                .image!,
                                                            width: 74,
                                                            height: 74,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.35, 0.35),
                                                        child: Text(
                                                          classesClassesRecordList
                                                              .where((e) =>
                                                                  e.reference ==
                                                                  FFAppState()
                                                                      .markerClassRef)
                                                              .toList()
                                                              .first
                                                              .creditsRequired!
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 1, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            classesClassesRecordList
                                                                .where((e) =>
                                                                    e.reference ==
                                                                    FFAppState()
                                                                        .markerClassRef)
                                                                .toList()
                                                                .first
                                                                .name!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            classesClassesRecordList
                                                                .where((e) =>
                                                                    e.reference ==
                                                                    FFAppState()
                                                                        .markerClassRef)
                                                                .toList()
                                                                .first
                                                                .exerciseType!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            classesClassesRecordList
                                                                .where((e) =>
                                                                    e.reference ==
                                                                    FFAppState()
                                                                        .markerClassRef)
                                                                .toList()
                                                                .first
                                                                .distance!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
