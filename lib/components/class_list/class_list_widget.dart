import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('CLASS_LIST_COMP_전체_보기_BTN_ON_TAP');
                        logFirebaseEvent('Button_clear_all_select_all');
                        setState(() => _model
                            .locationFilterChipsValueController?.value = []);
                      },
                      text: '전체 보기',
                      options: FFButtonOptions(
                        width: 90.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowChoiceChips(
                      options: [ChipData('서울대입구역'), ChipData('선릉역')],
                      onChanged: (val) => setState(
                          () => _model.locationFilterChipsValues = val),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Pretendard',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                        iconColor: FlutterFlowTheme.of(context).white,
                        iconSize: 18.0,
                        elevation: 4.0,
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.white,
                        textStyle: FlutterFlowTheme.of(context).bodySmall,
                        iconColor: Color(0xFFE3E7ED),
                        iconSize: 18.0,
                        elevation: 4.0,
                      ),
                      chipSpacing: 10.0,
                      multiselect: true,
                      initialized: _model.locationFilterChipsValues != null,
                      alignment: WrapAlignment.center,
                      controller: _model.locationFilterChipsValueController ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: StreamBuilder<List<ClassesRecord>>(
                stream: queryClassesRecord(
                  queryBuilder: (classesRecord) => classesRecord
                      .where('hideClass', isEqualTo: false)
                      .whereIn(
                          'locationFilter', _model.locationFilterChipsValues)
                      .where('exerciseType', isEqualTo: widget.category)
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
                  List<ClassesRecord> columnClassesRecordList = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnClassesRecordList.length,
                          (columnIndex) {
                        final columnClassesRecord =
                            columnClassesRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: InkWell(
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
                                      columnClassesRecord.exerciseType,
                                      ParamType.String,
                                    ),
                                    'coords': serializeParam(
                                      columnClassesRecord.coords,
                                      ParamType.LatLng,
                                    ),
                                    'creditsRequired': serializeParam(
                                      columnClassesRecord.creditsRequired,
                                      ParamType.int,
                                    ),
                                    'paymentUrl': serializeParam(
                                      columnClassesRecord.paymentUrl,
                                      ParamType.String,
                                    ),
                                    'originalPrice': serializeParam(
                                      columnClassesRecord.originalPrice,
                                      ParamType.int,
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

                                logFirebaseEvent('Row_google_analytics_event');
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
                                            AlignmentDirectional(0.7, -0.75),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    columnClassesRecord.image!,
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
                                                columnClassesRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                columnClassesRecord
                                                    .exerciseType!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Pretendard',
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
                                                columnClassesRecord.distance!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Pretendard',
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
  }
}
