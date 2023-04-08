import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_reservation_model.dart';
export 'empty_reservation_model.dart';

class EmptyReservationWidget extends StatefulWidget {
  const EmptyReservationWidget({Key? key}) : super(key: key);

  @override
  _EmptyReservationWidgetState createState() => _EmptyReservationWidgetState();
}

class _EmptyReservationWidgetState extends State<EmptyReservationWidget> {
  late EmptyReservationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyReservationModel());

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
        '6dr8u57v' /* 예약한 수업이 없습니다 */,
      ),
      style: FlutterFlowTheme.of(context).titleMedium,
    );
  }
}
