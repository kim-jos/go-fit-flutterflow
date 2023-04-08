import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_time_slots_available_model.dart';
export 'no_time_slots_available_model.dart';

class NoTimeSlotsAvailableWidget extends StatefulWidget {
  const NoTimeSlotsAvailableWidget({Key? key}) : super(key: key);

  @override
  _NoTimeSlotsAvailableWidgetState createState() =>
      _NoTimeSlotsAvailableWidgetState();
}

class _NoTimeSlotsAvailableWidgetState
    extends State<NoTimeSlotsAvailableWidget> {
  late NoTimeSlotsAvailableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoTimeSlotsAvailableModel());

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

    return Text(
      FFLocalizations.of(context).getText(
        '90u0b7za' /* 수업이 없습니다 */,
      ),
      style: FlutterFlowTheme.of(context).titleMedium,
    );
  }
}
