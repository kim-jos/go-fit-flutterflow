import '/backend/backend.dart';
import '/components/class_list/class_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'classes_model.dart';
export 'classes_model.dart';

class ClassesWidget extends StatefulWidget {
  const ClassesWidget({Key? key}) : super(key: key);

  @override
  _ClassesWidgetState createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {
  late ClassesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClassesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Classes'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CLASSES_PAGE_Classes_ON_INIT_STATE');
      logFirebaseEvent('Classes_update_app_state');
      FFAppState().update(() {});
      logFirebaseEvent('Classes_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ClassListWidget(),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<List<ClassesRecord>>(
      stream: queryClassesRecord(
        queryBuilder: (classesRecord) => classesRecord
            .where('hideClass', isEqualTo: false)
            .whereIn('exerciseType', _model.choiceChipsValues)
            .orderBy('priority'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        List<ClassesRecord> classesClassesRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 0.0),
                          child: Text(
                            '그룹 운동시설',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).displaySmall,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CLASSES_PAGE_전체_보기_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_clear_all_select_all');
                                      setState(() => _model
                                          .choiceChipsValueController
                                          ?.value = []);
                                    },
                                    text: '전체 보기',
                                    options: FFButtonOptions(
                                      width: 90.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 8.0, 0.0, 8.0),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData('필라테스'),
                                      ChipData('크로스핏'),
                                      ChipData('골프'),
                                      ChipData('발레'),
                                      ChipData('PT'),
                                      ChipData('주짓수'),
                                      ChipData('댄스'),
                                      ChipData('요가'),
                                      ChipData('스피닝')
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.choiceChipsValues = val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Pretendard',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).white,
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      iconColor: Color(0xFFE3E7ED),
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                    ),
                                    chipSpacing: 10.0,
                                    rowSpacing: 12.0,
                                    multiselect: true,
                                    initialized:
                                        _model.choiceChipsValues != null,
                                    alignment: WrapAlignment.center,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
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
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
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
                                          'GoogleMap_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().markerClassRef =
                                            classesClassesRecord.reference;
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                            markerColor: GoogleMarkerColor.blue,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 10.0,
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
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.01, 0.65),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CLASSES_PAGE_ShowClassListBtn_ON_TAP');
                                      logFirebaseEvent(
                                          'ShowClassListBtn_update_app_state');
                                      FFAppState().update(() {
                                        FFAppState().markerClassRef = null;
                                      });
                                      logFirebaseEvent(
                                          'ShowClassListBtn_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(_unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.8,
                                                child: ClassListWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    text: '목록 보기',
                                    options: FFButtonOptions(
                                      width: 100.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().markerClassRef != null)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.95),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CLASSES_PAGE_ClassContainer_ON_TAP');
                                        logFirebaseEvent(
                                            'ClassContainer_navigate_to');

                                        context.pushNamed(
                                          'ClassDetails',
                                          queryParameters: {
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
                                            'coords': serializeParam(
                                              classesClassesRecordList
                                                  .where((e) =>
                                                      e.reference ==
                                                      FFAppState()
                                                          .markerClassRef)
                                                  .toList()
                                                  .first
                                                  .coords,
                                              ParamType.LatLng,
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
                                            'paymentUrl': serializeParam(
                                              classesClassesRecordList
                                                  .where((e) =>
                                                      e.reference ==
                                                      FFAppState()
                                                          .markerClassRef)
                                                  .toList()
                                                  .first
                                                  .paymentUrl,
                                              ParamType.String,
                                            ),
                                            'originalPrice': serializeParam(
                                              classesClassesRecordList
                                                  .where((e) =>
                                                      e.reference ==
                                                      FFAppState()
                                                          .markerClassRef)
                                                  .toList()
                                                  .first
                                                  .originalPrice,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );

                                        logFirebaseEvent(
                                            'ClassContainer_google_analytics_event');
                                        logFirebaseEvent(
                                            'Classes Page - ${classesClassesRecordList.where((e) => e.reference == FFAppState().markerClassRef).toList().first.name}');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: classesClassesRecordList
                                                              .where((e) =>
                                                                  e.reference ==
                                                                  FFAppState()
                                                                      .markerClassRef)
                                                              .toList()
                                                              .first
                                                              .image,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 1.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall,
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
                                                              .exerciseType,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
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
                                                              .distance,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Pretendard',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
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
