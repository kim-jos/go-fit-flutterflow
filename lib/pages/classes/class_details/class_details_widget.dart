import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirmation_reservation/confirmation_reservation_widget.dart';
import '/components/no_time_slots_available/no_time_slots_available_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'class_details_model.dart';
export 'class_details_model.dart';

class ClassDetailsWidget extends StatefulWidget {
  const ClassDetailsWidget({
    Key? key,
    this.classRef,
    this.className,
    this.exerciseType,
    this.creditsRequired,
    this.coords,
    this.paymentUrl,
    this.originalPrice,
  }) : super(key: key);

  final DocumentReference? classRef;
  final String? className;
  final String? exerciseType;
  final int? creditsRequired;
  final LatLng? coords;
  final String? paymentUrl;
  final int? originalPrice;

  @override
  _ClassDetailsWidgetState createState() => _ClassDetailsWidgetState();
}

class _ClassDetailsWidgetState extends State<ClassDetailsWidget> {
  late ClassDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClassDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ClassDetails'});
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

    return StreamBuilder<List<ClassDetailsRecord>>(
      stream: queryClassDetailsRecord(
        queryBuilder: (classDetailsRecord) =>
            classDetailsRecord.where('classRef', isEqualTo: widget.classRef),
        singleRecord: true,
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
        List<ClassDetailsRecord> classDetailsClassDetailsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final classDetailsClassDetailsRecord =
            classDetailsClassDetailsRecordList.isNotEmpty
                ? classDetailsClassDetailsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
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
                logFirebaseEvent('CLASS_DETAILS_chevron_left_rounded_ICN_O');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              widget.className!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Pretendard',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final images = classDetailsClassDetailsRecord!
                                .images!
                                .toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                    List.generate(images.length, (imagesIndex) {
                                  final imagesItem = images[imagesIndex];
                                  return CachedNetworkImage(
                                    imageUrl: imagesItem,
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 400.0,
                                    fit: BoxFit.cover,
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                widget.className!,
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CLASS_DETAILS_PAGE_Image_iiqej88j_ON_TAP');
                                        logFirebaseEvent('Image_launch_u_r_l');
                                        await launchURL(
                                            classDetailsClassDetailsRecord!
                                                .instagram!);
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CLASS_DETAILS_PAGE_Image_wx4ck60g_ON_TAP');
                                      logFirebaseEvent('Image_launch_u_r_l');
                                      await launchURL(
                                          classDetailsClassDetailsRecord!
                                              .website!);
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://play-lh.googleusercontent.com/Cewes10AmAykxX9X18sMsyC4aFalv8jsyXigdfydFcgDVDnyzKsgbEtkQ5LhcCftBB1f',
                                      width: 25.0,
                                      height: 25.0,
                                      fit: BoxFit.cover,
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
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 5.0, 0.0),
                        child: Text(
                          classDetailsClassDetailsRecord!.description!,
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '가격 정보',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 10.0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '기존 가격',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  fontSize: 18.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: formatNumber(
                                                    widget.originalPrice,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: '원',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Go Fit 가격',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Pretendard',
                                                fontSize: 18.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: formatNumber(
                                                  widget.creditsRequired,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '원',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Pretendard',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: formatNumber(
                                                    1 -
                                                        (widget.creditsRequired! /
                                                            widget
                                                                .originalPrice!),
                                                    formatType:
                                                        FormatType.percent,
                                                  ),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: ' 할인',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Pretendard',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
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
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '수업 정보 요약',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 10.0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.tshirt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 3.0, 0.0),
                                            child: AutoSizeText(
                                              classDetailsClassDetailsRecord!
                                                  .requirements!,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.stopwatch,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                          Text(
                                            classDetailsClassDetailsRecord!
                                                .duration!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.shower,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 30.0,
                                          ),
                                        ),
                                        Text(
                                          classDetailsClassDetailsRecord!
                                                  .hasShower!
                                              ? '샤워 가능'
                                              : '샤워 불가능',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
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
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '수업 예약',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      if (loggedIn == false)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CLASS_DETAILS_PAGE_로그인_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('AuthLogin');
                              },
                              text: '로그인',
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
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      if (loggedIn)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlutterFlowCalendar(
                                color: FlutterFlowTheme.of(context).primary,
                                weekFormat: true,
                                weekStartsMonday: false,
                                initialDate: getCurrentTimestamp,
                                onChange:
                                    (DateTimeRange? newSelectedDate) async {
                                  _model.calendarSelectedDay = newSelectedDate;
                                  logFirebaseEvent(
                                      'CLASS_DETAILS_Calendar_fg0d43po_ON_DATE_');
                                  logFirebaseEvent('Calendar_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().selectedDate =
                                        _model.calendarSelectedDay?.start;
                                  });
                                  setState(() {});
                                },
                                titleStyle: TextStyle(),
                                dayOfWeekStyle: TextStyle(),
                                dateStyle: TextStyle(),
                                selectedDateStyle: TextStyle(),
                                inactiveDateStyle: TextStyle(),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              StreamBuilder<List<ReservationsRecord>>(
                                stream: queryReservationsRecord(
                                  queryBuilder: (reservationsRecord) =>
                                      reservationsRecord
                                          .where('date',
                                              isEqualTo: dateTimeFormat(
                                                        'yMd',
                                                        _model
                                                            .calendarSelectedDay
                                                            ?.start,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) !=
                                                      ''
                                                  ? dateTimeFormat(
                                                      'yMd',
                                                      _model.calendarSelectedDay
                                                          ?.start,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : null)
                                          .where('className',
                                              isEqualTo: widget.className != ''
                                                  ? widget.className
                                                  : null)
                                          .where('user',
                                              isEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ReservationsRecord>
                                      containerReservationsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: StreamBuilder<
                                          List<ClassAvailableTimeSlotsRecord>>(
                                        stream:
                                            queryClassAvailableTimeSlotsRecord(
                                          queryBuilder: (classAvailableTimeSlotsRecord) =>
                                              classAvailableTimeSlotsRecord
                                                  .where('weekdays',
                                                      arrayContains: functions
                                                          .convertWeekDayToInteger(
                                                              _model
                                                                  .calendarSelectedDay!
                                                                  .start))
                                                  .where('classRef',
                                                      isEqualTo:
                                                          widget.classRef)
                                                  .orderBy('startTime'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ClassAvailableTimeSlotsRecord>
                                              rowReserveClassAvailableTimeSlotsRecordList =
                                              snapshot.data!;
                                          if (rowReserveClassAvailableTimeSlotsRecordList
                                              .isEmpty) {
                                            return Center(
                                              child:
                                                  NoTimeSlotsAvailableWidget(),
                                            );
                                          }
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  rowReserveClassAvailableTimeSlotsRecordList
                                                      .length,
                                                  (rowReserveIndex) {
                                                final rowReserveClassAvailableTimeSlotsRecord =
                                                    rowReserveClassAvailableTimeSlotsRecordList[
                                                        rowReserveIndex];
                                                return Visibility(
                                                  visible: (containerReservationsRecordList
                                                              .length <
                                                          rowReserveClassAvailableTimeSlotsRecord
                                                              .maxLimit!) &&
                                                      (functions.differenceInHours(
                                                              getCurrentTimestamp,
                                                              functions.dateTimeParser(
                                                                  rowReserveClassAvailableTimeSlotsRecord
                                                                      .startTime!,
                                                                  _model
                                                                      .calendarSelectedDay!
                                                                      .start)) >
                                                          rowReserveClassAvailableTimeSlotsRecord
                                                              .minHoursBeforeClass!) &&
                                                      (functions.differenceInHours(
                                                              getCurrentTimestamp,
                                                              functions.dateTimeParser(
                                                                  rowReserveClassAvailableTimeSlotsRecord
                                                                      .startTime!,
                                                                  _model
                                                                      .calendarSelectedDay!
                                                                      .start)) <
                                                          rowReserveClassAvailableTimeSlotsRecord
                                                              .maxHoursBeforeClass!) &&
                                                      (containerReservationsRecordList
                                                              .where((e) =>
                                                                  e.time ==
                                                                  rowReserveClassAvailableTimeSlotsRecord
                                                                      .startTime)
                                                              .toList()
                                                              .length <
                                                          1),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                7.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CLASS_DETAILS_PAGE_BUTTON_BTN_ON_TAP');
                                                        if (!(currentPhoneNumber !=
                                                                null &&
                                                            currentPhoneNumber !=
                                                                '')) {
                                                          logFirebaseEvent(
                                                              'Button_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '전화번호 입력 해주세요'),
                                                                content: Text(
                                                                    '예약은 전화번호 등록 후에 가능합니다'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        '확인'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                              'MyPage');
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .selectedTime =
                                                              rowReserveClassAvailableTimeSlotsRecord
                                                                  .startTime!;
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_google_analytics_event');
                                                        logFirebaseEvent(
                                                            'MakeReservation-${widget.className}');
                                                        logFirebaseEvent(
                                                            'Button_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          context: context,
                                                          builder:
                                                              (bottomSheetContext) {
                                                            return Padding(
                                                              padding: MediaQuery.of(
                                                                      bottomSheetContext)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.5,
                                                                child:
                                                                    ConfirmationReservationWidget(
                                                                  className: widget
                                                                      .className,
                                                                  selectedDate: _model
                                                                      .calendarSelectedDay
                                                                      ?.start,
                                                                  selectedTime:
                                                                      FFAppState()
                                                                          .selectedTime,
                                                                  classRef: widget
                                                                      .classRef,
                                                                  selectedTimeSlot:
                                                                      rowReserveClassAvailableTimeSlotsRecord
                                                                          .reference,
                                                                  creditsRequired:
                                                                      widget
                                                                          .creditsRequired,
                                                                  paymentUrl: widget
                                                                      .paymentUrl,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text: rowReserveClassAvailableTimeSlotsRecord
                                                                  .startTime ==
                                                              '22:30'
                                                          ? '종일권'
                                                          : rowReserveClassAvailableTimeSlotsRecord
                                                              .startTime!,
                                                      options: FFButtonOptions(
                                                        width: 130.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Pretendard',
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
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
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '공지사항',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 0.0, 10.0),
                        child: Builder(
                          builder: (context) {
                            final infoList =
                                classDetailsClassDetailsRecord!.info!.toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(infoList.length,
                                  (infoListIndex) {
                                final infoListItem = infoList[infoListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    infoListItem,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '운영시간',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 0.0, 10.0),
                        child: Builder(
                          builder: (context) {
                            final businessHours =
                                classDetailsClassDetailsRecord!.businessHours!
                                    .toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(businessHours.length,
                                  (businessHoursIndex) {
                                final businessHoursItem =
                                    businessHours[businessHoursIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    businessHoursItem,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 12.0, 0.0, 5.0),
                        child: Text(
                          '리뷰',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 0.0, 10.0),
                        child: StreamBuilder<List<ReviewsRecord>>(
                          stream: queryReviewsRecord(
                            queryBuilder: (reviewsRecord) => reviewsRecord
                                .where('classRef', isEqualTo: widget.classRef)
                                .orderBy('createdAt', descending: true),
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
                            List<ReviewsRecord> rowReviewsRecordList =
                                snapshot.data!;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    rowReviewsRecordList.length, (rowIndex) {
                                  final rowReviewsRecord =
                                      rowReviewsRecordList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: Container(
                                      width: 150.0,
                                      height: 130.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    rowReviewsRecord.userRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowUsersRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          rowUsersRecord
                                                                      .photoUrl ==
                                                                  ''
                                                              ? random_data
                                                                  .randomImageUrl(
                                                                  0,
                                                                  0,
                                                                )
                                                              : rowUsersRecord
                                                                  .photoUrl!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              rowUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  'M/d H:mm',
                                                                  rowReviewsRecord
                                                                      .createdAt!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Pretendard',
                                                                      fontSize:
                                                                          9.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 3.0, 0.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    RatingBarIndicator(
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      rating: rowReviewsRecord
                                                          .rating!
                                                          .toDouble(),
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 20.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                rowReviewsRecord.review!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Pretendard',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
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
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 277.8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(builder: (context) {
                            final _googleMapMarker = widget.coords;
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  widget.coords!,
                              markers: [
                                if (_googleMapMarker != null)
                                  FlutterFlowMarker(
                                    _googleMapMarker.serialize(),
                                    _googleMapMarker,
                                  ),
                              ],
                              markerColor: GoogleMarkerColor.blue,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 18.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: false,
                              showLocation: false,
                              showCompass: false,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
