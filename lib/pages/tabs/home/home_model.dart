import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/class_list/class_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchClass widget.
  TextEditingController? searchClassController;
  String? Function(BuildContext, String?)? searchClassControllerValidator;
  List<ClassesRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchClassController?.dispose();
  }

  /// Additional helper methods are added here.

}
