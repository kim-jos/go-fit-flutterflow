import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoTimeSlotsAvailableWidget extends StatefulWidget {
  const NoTimeSlotsAvailableWidget({Key? key}) : super(key: key);

  @override
  _NoTimeSlotsAvailableWidgetState createState() =>
      _NoTimeSlotsAvailableWidgetState();
}

class _NoTimeSlotsAvailableWidgetState
    extends State<NoTimeSlotsAvailableWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      '수업이 없습니다',
      style: FlutterFlowTheme.of(context).subtitle1,
    );
  }
}
