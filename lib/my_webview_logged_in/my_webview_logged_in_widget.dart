import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
            StreamBuilder<List<WebviewRecord>>(
              stream: queryWebviewRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: SpinKitWanderingCubes(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                    ),
                  );
                }
                List<WebviewRecord> myWebViewWebviewRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final myWebViewWebviewRecord =
                    myWebViewWebviewRecordList.isNotEmpty
                        ? myWebViewWebviewRecordList.first
                        : null;
                return Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: custom_widgets.MyWebView(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    url: myWebViewWebviewRecord!.url,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
