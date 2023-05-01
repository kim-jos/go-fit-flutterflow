import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirmation_reservation/confirmation_reservation_widget.dart';
import '/components/no_time_slots_available/no_time_slots_available_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'class_list_model.dart';
export 'class_list_model.dart';

class ClassListWidget extends StatefulWidget {
  const ClassListWidget({
    Key? key,
    this.classList,
    this.category,
  }) : super(key: key);

  final List<ClassesRecord>? classList;
  final String? category;

  @override
  _ClassListWidgetState createState() => _ClassListWidgetState();
}

class _ClassListWidgetState extends State<ClassListWidget> {
  late ClassListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClassListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CLASS_LIST_COMP_ClassList_ON_INIT_STATE');
      logFirebaseEvent('ClassList_update_app_state');
      setState(() {
        FFAppState().selectedDay = 1;
        FFAppState().classDate = getCurrentTimestamp;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          StreamBuilder<List<WorkoutCategoriesRecord>>(
            stream: queryWorkoutCategoriesRecord(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SpinKitCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                  ),
                );
              }
              List<WorkoutCategoriesRecord>
                  containerWorkoutCategoriesRecordList = snapshot.data!;
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  1.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: ['서울대입구역', '선릉역'],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                width: 180.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Pretendard',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: false,
                                        ),
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: '지역 선택',
                                searchHintText: 'Search for an item...',
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 30.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
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
                                            'CLASS_LIST_COMP_전체_보기_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_clear_all_select_all');
                                        setState(() => _model
                                            .categoryFilterValueController
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options:
                                          containerWorkoutCategoriesRecordList
                                              .map((e) => e.category)
                                              .withoutNulls
                                              .toList()
                                              .map((label) => ChipData(label))
                                              .toList(),
                                      onChanged: (val) => setState(() =>
                                          _model.categoryFilterValues = val),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: false,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                      ),
                                      chipSpacing: 7.0,
                                      multiselect: true,
                                      initialized:
                                          _model.categoryFilterValues != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .categoryFilterValueController ??=
                                          FormFieldController<List<String>>(
                                        [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CLASS_LIST_Container_3jdax66f_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      setState(() {
                                        FFAppState().classDate =
                                            getCurrentTimestamp;
                                        FFAppState().selectedDay = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 80.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '오늘',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Pretendard',
                                                color: valueOrDefault<Color>(
                                                  FFAppState().selectedDay == 1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 0.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().selectedDay == 1
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Colors.transparent,
                                          Colors.transparent,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CLASS_LIST_Container_xvd7xznr_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        setState(() {
                                          FFAppState().classDate =
                                              functions.addDaysToCurrentTime(1);
                                          FFAppState().selectedDay = 2;
                                        });
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            dateTimeFormat(
                                              'MEd',
                                              functions.addDaysToCurrentTime(1),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().selectedDay ==
                                                            2
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 0.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().selectedDay == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Colors.transparent,
                                          Colors.transparent,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CLASS_LIST_Container_akh6baa5_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        setState(() {
                                          FFAppState().classDate =
                                              functions.addDaysToCurrentTime(2);
                                          FFAppState().selectedDay = 3;
                                        });
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            dateTimeFormat(
                                              'MEd',
                                              functions.addDaysToCurrentTime(2),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().selectedDay ==
                                                            3
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 0.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().selectedDay == 3
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Colors.transparent,
                                          Colors.transparent,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CLASS_LIST_Container_4lutxf47_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        setState(() {
                                          FFAppState().classDate =
                                              functions.addDaysToCurrentTime(3);
                                          FFAppState().selectedDay = 4;
                                        });
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            dateTimeFormat(
                                              'MEd',
                                              functions.addDaysToCurrentTime(3),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().selectedDay ==
                                                            4
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 0.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().selectedDay == 4
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Colors.transparent,
                                          Colors.transparent,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CLASS_LIST_Container_z28vo0w2_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        setState(() {
                                          FFAppState().classDate =
                                              functions.addDaysToCurrentTime(4);
                                          FFAppState().selectedDay = 5;
                                        });
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            dateTimeFormat(
                                              'MEd',
                                              functions.addDaysToCurrentTime(4),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().selectedDay ==
                                                            5
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 0.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().selectedDay == 5
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Colors.transparent,
                                          Colors.transparent,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: StreamBuilder<List<ClassesRecord>>(
                          stream: queryClassesRecord(
                            queryBuilder: (classesRecord) => classesRecord
                                .where('hideClass', isEqualTo: false)
                                .where('locationFilter',
                                    isEqualTo: _model.dropDownValue)
                                .whereIn(
                                    'exerciseType', _model.categoryFilterValues)
                                .orderBy('priority'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 30.0,
                                  height: 30.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 30.0,
                                  ),
                                ),
                              );
                            }
                            List<ClassesRecord> columnClassesRecordList =
                                snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnClassesRecordList.length,
                                    (columnIndex) {
                                  final columnClassesRecord =
                                      columnClassesRecordList[columnIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 134.5,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CLASS_LIST_COMP_Row_rrw42ml1_ON_TAP');
                                          logFirebaseEvent('Row_navigate_to');

                                          context.pushNamed(
                                            'ClassDetails',
                                            queryParams: {
                                              'classRef': serializeParam(
                                                columnClassesRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'className': serializeParam(
                                                columnClassesRecord.name,
                                                ParamType.String,
                                              ),
                                              'exerciseType': serializeParam(
                                                columnClassesRecord
                                                    .exerciseType,
                                                ParamType.String,
                                              ),
                                              'coords': serializeParam(
                                                columnClassesRecord.coords,
                                                ParamType.LatLng,
                                              ),
                                              'creditsRequired': serializeParam(
                                                columnClassesRecord
                                                    .creditsRequired,
                                                ParamType.int,
                                              ),
                                              'paymentUrl': serializeParam(
                                                columnClassesRecord.paymentUrl,
                                                ParamType.String,
                                              ),
                                              'originalPrice': serializeParam(
                                                columnClassesRecord
                                                    .originalPrice,
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

                                          logFirebaseEvent(
                                              'Row_google_analytics_event');
                                          logFirebaseEvent(
                                              'ClassListWidget-${columnClassesRecord.name}');
                                        },
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
                                                          imageUrl:
                                                              columnClassesRecord
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
                                                          columnClassesRecord
                                                              .name!,
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
                                                          columnClassesRecord
                                                              .exerciseType!,
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
                                                          columnClassesRecord
                                                              .distance!,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  ReservationsRecord>>(
                                                            stream:
                                                                queryReservationsRecord(
                                                              queryBuilder: (reservationsRecord) => reservationsRecord
                                                                  .where('date',
                                                                      isEqualTo: dateTimeFormat(
                                                                                'yMd',
                                                                                FFAppState().classDate,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) !=
                                                                              ''
                                                                          ? dateTimeFormat(
                                                                              'yMd',
                                                                              FFAppState().classDate,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            )
                                                                          : null)
                                                                  .where('className', isEqualTo: columnClassesRecord.name != '' ? columnClassesRecord.name : null)
                                                                  .where('user', isEqualTo: currentUserReference),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ReservationsRecord>
                                                                  containerReservationsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          ClassAvailableTimeSlotsRecord>>(
                                                                    stream:
                                                                        queryClassAvailableTimeSlotsRecord(
                                                                      queryBuilder: (classAvailableTimeSlotsRecord) => classAvailableTimeSlotsRecord
                                                                          .where(
                                                                              'weekdays',
                                                                              arrayContains: functions.convertWeekDayToInteger(FFAppState()
                                                                                  .classDate!))
                                                                          .where(
                                                                              'classRef',
                                                                              isEqualTo: columnClassesRecord.reference)
                                                                          .orderBy('startTime'),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                30.0,
                                                                            height:
                                                                                30.0,
                                                                            child:
                                                                                SpinKitCircle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 30.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ClassAvailableTimeSlotsRecord>
                                                                          rowReserveClassAvailableTimeSlotsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      if (rowReserveClassAvailableTimeSlotsRecordList
                                                                          .isEmpty) {
                                                                        return Center(
                                                                          child:
                                                                              NoTimeSlotsAvailableWidget(),
                                                                        );
                                                                      }
                                                                      return SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              rowReserveClassAvailableTimeSlotsRecordList.length,
                                                                              (rowReserveIndex) {
                                                                            final rowReserveClassAvailableTimeSlotsRecord =
                                                                                rowReserveClassAvailableTimeSlotsRecordList[rowReserveIndex];
                                                                            return Visibility(
                                                                              visible: (containerReservationsRecordList.length < rowReserveClassAvailableTimeSlotsRecord.maxLimit!) && (functions.differenceInHours(getCurrentTimestamp, functions.dateTimeParser(rowReserveClassAvailableTimeSlotsRecord.startTime!, FFAppState().classDate!)) > rowReserveClassAvailableTimeSlotsRecord.minHoursBeforeClass!) && (functions.differenceInHours(getCurrentTimestamp, functions.dateTimeParser(rowReserveClassAvailableTimeSlotsRecord.startTime!, FFAppState().classDate!)) < rowReserveClassAvailableTimeSlotsRecord.maxHoursBeforeClass!) && (containerReservationsRecordList.where((e) => e.time == rowReserveClassAvailableTimeSlotsRecord.startTime).toList().length < 1),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('CLASS_LIST_COMP_BUTTON_BTN_ON_TAP');
                                                                                    if (!(currentPhoneNumber != null && currentPhoneNumber != '')) {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('전화번호 입력 해주세요'),
                                                                                            content: Text('예약은 전화번호 등록 후에 가능합니다'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('확인'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      logFirebaseEvent('Button_navigate_to');

                                                                                      context.pushNamed('MyPage');
                                                                                    }
                                                                                    logFirebaseEvent('Button_update_app_state');
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().selectedTime = rowReserveClassAvailableTimeSlotsRecord.startTime!;
                                                                                      FFAppState().selectedDate = FFAppState().classDate;
                                                                                    });
                                                                                    logFirebaseEvent('Button_google_analytics_event');
                                                                                    logFirebaseEvent('Reserve${columnClassesRecord.name}');
                                                                                    logFirebaseEvent('Button_bottom_sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x00000000),
                                                                                      context: context,
                                                                                      builder: (bottomSheetContext) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.5,
                                                                                            child: ConfirmationReservationWidget(
                                                                                              className: columnClassesRecord.name,
                                                                                              selectedDate: FFAppState().classDate,
                                                                                              selectedTime: FFAppState().selectedTime,
                                                                                              classRef: columnClassesRecord.reference,
                                                                                              selectedTimeSlot: rowReserveClassAvailableTimeSlotsRecord.reference,
                                                                                              creditsRequired: columnClassesRecord.creditsRequired,
                                                                                              paymentUrl: columnClassesRecord.paymentUrl,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  text: rowReserveClassAvailableTimeSlotsRecord.startTime == '22:30' ? '종일권' : rowReserveClassAvailableTimeSlotsRecord.startTime!,
                                                                                  options: FFButtonOptions(
                                                                                    width: 130.0,
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_outlined,
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
                                }),
                              ),
                            );
                          },
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
    );
  }
}
