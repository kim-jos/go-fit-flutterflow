import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  }) : super(key: key);

  final List<ClassesRecord>? classList;

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
        child: Builder(
          builder: (context) {
            final classes = widget.classList?.toList() ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: classes.length,
              itemBuilder: (context, classesIndex) {
                final classesItem = classes[classesIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('CLASS_LIST_COMP_Row_rrw42ml1_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed(
                          'ClassDetails',
                          queryParams: {
                            'classRef': serializeParam(
                              classesItem.reference,
                              ParamType.DocumentReference,
                            ),
                            'className': serializeParam(
                              classesItem.name,
                              ParamType.String,
                            ),
                            'exerciseType': serializeParam(
                              classesItem.exerciseType,
                              ParamType.String,
                            ),
                            'coords': serializeParam(
                              classesItem.coords,
                              ParamType.LatLng,
                            ),
                            'creditsRequired': serializeParam(
                              classesItem.creditsRequired,
                              ParamType.int,
                            ),
                            'paymentUrl': serializeParam(
                              classesItem.paymentUrl,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );

                        logFirebaseEvent('Row_google_analytics_event');
                        logFirebaseEvent(
                            'ClassList Widget - ${classesItem.name}');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional(0.7, -0.75),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl: classesItem.image!,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        classesItem.name!,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        classesItem.exerciseType!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        classesItem.distance!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Pretendard',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.w500,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
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
    );
  }
}
