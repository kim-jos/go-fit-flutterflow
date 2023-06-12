import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneNumberModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for referralCode widget.
  TextEditingController? referralCodeController;
  String? Function(BuildContext, String?)? referralCodeControllerValidator;
  // Stores action output result for [Custom Action - doesReferralCodeExist] action in VerifyReferrer widget.
  DocumentReference? referrersCode;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    phoneNumberController?.dispose();
    referralCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
