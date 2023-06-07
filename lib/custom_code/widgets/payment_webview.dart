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

class PaymentWebview extends StatefulWidget {
  const PaymentWebview({
    Key? key,
    this.width,
    this.height,
    required this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;

  @override
  _PaymentWebviewState createState() => _PaymentWebviewState();
}

class _PaymentWebviewState extends State<PaymentWebview> {
  late WebViewXController webviewController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

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
                javascriptMode: JavascriptMode.unrestricted,
                dartCallBacks: Set.from(
                  [
                    DartCallback(
                      name: 'success',
                      callBack: (message) {
                        if (message == 'Y') {
                          print('holy crrap it actually worked');
                        } else if (message == 'N') {
                          print('holy crap it didnt work but it worked.');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
