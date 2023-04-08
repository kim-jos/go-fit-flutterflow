import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    Key? key,
    this.classRef,
    this.reservationRef,
  }) : super(key: key);

  final DocumentReference? classRef;
  final DocumentReference? reservationRef;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late ReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Review'});
    _model.textController ??= TextEditingController();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayIcon,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('REVIEW_chevron_left_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '9exzt1e7' /* 리뷰 */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBarValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= 0.0,
                          unratedColor: Color(0xFF9E9E9E),
                          itemCount: 5,
                          itemSize: 40.0,
                          glowColor: FlutterFlowTheme.of(context).primary,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '3nhsokfa' /* 수업은 어땠나요? */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 32.0, 20.0, 12.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 4,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('REVIEW_PAGE_리뷰_작성하기_BTN_ON_TAP');
                if ((_model.textController.text != null &&
                        _model.textController.text != '') &&
                    (_model.ratingBarValue != null)) {
                  logFirebaseEvent('Button_backend_call');

                  final reviewsCreateData = createReviewsRecordData(
                    userRef: currentUserReference,
                    classRef: widget.classRef,
                    createdAt: getCurrentTimestamp,
                    review: _model.textController.text,
                    rating: _model.ratingBarValue?.round(),
                    reservationRef: widget.reservationRef,
                  );
                  await ReviewsRecord.collection.doc().set(reviewsCreateData);
                  logFirebaseEvent('Button_show_snack_bar');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '리뷰 감사합니다! :)',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed('MyReservations');
                } else {
                  return;
                }
              },
              text: FFLocalizations.of(context).getText(
                '9msuiz14' /* 리뷰 작성하기 */,
              ),
              options: FFButtonOptions(
                width: 270.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
