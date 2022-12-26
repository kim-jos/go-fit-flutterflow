import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_reservation_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MyReservationsWidget extends StatefulWidget {
  const MyReservationsWidget({Key? key}) : super(key: key);

  @override
  _MyReservationsWidgetState createState() => _MyReservationsWidgetState();
}

class _MyReservationsWidgetState extends State<MyReservationsWidget> {
  PagingController<DocumentSnapshot?, ReservationsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MyReservations'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('MY_RESERVATIONS_arrow_back_rounded_ICN_O');
            logFirebaseEvent('IconButton_navigate_to');

            context.goNamed('Settings');
          },
        ),
        title: Text(
          '예약현황',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: Text(
                    '최신',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
                PagedListView<DocumentSnapshot<Object?>?, ReservationsRecord>(
                  pagingController: () {
                    final Query<Object?> Function(Query<Object?>) queryBuilder =
                        (reservationsRecord) => reservationsRecord
                            .where('user', isEqualTo: currentUserReference)
                            .orderBy('date', descending: true);
                    if (_pagingController != null) {
                      final query = queryBuilder(ReservationsRecord.collection);
                      if (query != _pagingQuery) {
                        // The query has changed
                        _pagingQuery = query;
                        _streamSubscriptions.forEach((s) => s?.cancel());
                        _streamSubscriptions.clear();
                        _pagingController!.refresh();
                      }
                      return _pagingController!;
                    }

                    _pagingController = PagingController(firstPageKey: null);
                    _pagingQuery = queryBuilder(ReservationsRecord.collection);
                    _pagingController!.addPageRequestListener((nextPageMarker) {
                      queryReservationsRecordPage(
                        queryBuilder: (reservationsRecord) => reservationsRecord
                            .where('user', isEqualTo: currentUserReference)
                            .orderBy('date', descending: true),
                        nextPageMarker: nextPageMarker,
                        pageSize: 15,
                        isStream: true,
                      ).then((page) {
                        _pagingController!.appendPage(
                          page.data,
                          page.nextPageMarker,
                        );
                        final streamSubscription =
                            page.dataStream?.listen((data) {
                          final itemIndexes = _pagingController!.itemList!
                              .asMap()
                              .map((k, v) => MapEntry(v.reference.id, k));
                          data.forEach((item) {
                            final index = itemIndexes[item.reference.id];
                            final items = _pagingController!.itemList!;
                            if (index != null) {
                              items.replaceRange(index, index + 1, [item]);
                              _pagingController!.itemList = {
                                for (var item in items) item.reference: item
                              }.values.toList();
                            }
                          });
                          setState(() {});
                        });
                        _streamSubscriptions.add(streamSubscription);
                      });
                    });
                    return _pagingController!;
                  }(),
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  builderDelegate:
                      PagedChildBuilderDelegate<ReservationsRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: SpinKitRing(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 40,
                        ),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) => Center(
                      child: EmptyReservationWidget(),
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewReservationsRecord =
                          _pagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 1),
                        child: FutureBuilder<ClassAvailableTimeSlotsRecord>(
                          future: ClassAvailableTimeSlotsRecord.getDocumentOnce(
                              listViewReservationsRecord.timeSlot!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SpinKitRing(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 40,
                                  ),
                                ),
                              );
                            }
                            final containerClassAvailableTimeSlotsRecord =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: 91,
                              constraints: BoxConstraints(
                                maxHeight: 500,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    offset: Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 5, 16, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewReservationsRecord.className!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                listViewReservationsRecord
                                                    .date!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                ' - ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                containerClassAvailableTimeSlotsRecord
                                                    .startTime!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MY_RESERVATIONS_Icon_rwo8uv97_ON_TAP');
                                        var _shouldSetState = false;
                                        if (functions.differenceInHours(
                                                getCurrentTimestamp,
                                                functions.dateAndTimeStringParser(
                                                    listViewReservationsRecord
                                                        .date!,
                                                    listViewReservationsRecord
                                                        .time!)) <
                                            containerClassAvailableTimeSlotsRecord
                                                .minHoursToCancel!) {
                                          logFirebaseEvent('Icon_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('예약 취소 불가능'),
                                                content: Text(
                                                    '예약 취소는 수업 시작 24시간 전에 해주세요!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        logFirebaseEvent('Icon_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('예약 취소'),
                                                      content:
                                                          Text('예약을 취소하시겠습니까?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('아니요'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('예'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        // Increment credits
                                        logFirebaseEvent(
                                            'Icon_Incrementcredits');

                                        final usersUpdateData = {
                                          'currCredits': FieldValue.increment(
                                              listViewReservationsRecord
                                                  .classRequiredCredits!),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        // Remove from chat collection
                                        logFirebaseEvent(
                                            'Icon_Removefromchatcollection');

                                        final chatsUpdateData = {
                                          'users': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        };
                                        await listViewReservationsRecord
                                            .chatsRef!
                                            .update(chatsUpdateData);
                                        _shouldSetState = true;
                                        // reservations collection
                                        logFirebaseEvent(
                                            'Icon_reservationscollection');
                                        await listViewReservationsRecord
                                            .reference
                                            .delete();
                                        logFirebaseEvent('Icon_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('예약 취소 완료'),
                                              content: Text('예약이 취소됐습니다'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('확인'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.goNamed('MyReservations');

                                        if (_shouldSetState) setState(() {});
                                      },
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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
