// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx_plus/webviewx_plus.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({
    Key? key,
    this.width,
    this.height,
    required this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewXController webviewController;
  // LatLng? currentUserLocationValue;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
    //     .then((loc) => setState(() => currentUserLocationValue = loc));

    // logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyWebview'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  // Future<void> getLocation() async {
  //   final javascriptCode = '''
  //   navigator.geolocation.getCurrentPosition = function(successCallback, errorCallback, options) {
  //     successCallback({ coords: { latitude: ${currentUserLocationValue!.latitude}, longitude: ${currentUserLocationValue!.longitude} } });
  //   }
  // ''';

  //   await webviewController.evalRawJavascript(javascriptCode);
  // }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _handleBackButton() async {
    if (await webviewController.canGoBack()) {
      webviewController.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _handleBackButton,
          child: Container(
            child: Expanded(
              child: WebViewX(
                width: MediaQuery.of(context).size.height * 100,
                height: MediaQuery.of(context).size.width * 100,
                initialContent: widget.url,
                initialSourceType: SourceType.url,
                onWebViewCreated: (controller) {
                  webviewController = controller;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
