import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_webview_logged_in_model.dart';
export 'my_webview_logged_in_model.dart';

class MyWebviewLoggedInWidget extends StatefulWidget {
  const MyWebviewLoggedInWidget({Key? key}) : super(key: key);

  @override
  _MyWebviewLoggedInWidgetState createState() =>
      _MyWebviewLoggedInWidgetState();
}

class _MyWebviewLoggedInWidgetState extends State<MyWebviewLoggedInWidget> {
  late MyWebviewLoggedInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyWebviewLoggedInModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MyWebviewLoggedIn'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlutterFlowWebView(
              url: 'https://flutter.dev',
              bypass: false,
              height: 500.0,
              verticalScroll: false,
              horizontalScroll: false,
            ),
          ],
        ),
      ),
    );
  }
}
