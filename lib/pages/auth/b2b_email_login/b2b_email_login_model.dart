import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class B2bEmailLoginModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? companyEmail;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for name-Create widget.
  TextEditingController? nameCreateController;
  String? Function(BuildContext, String?)? nameCreateControllerValidator;
  // State field(s) for emailAddress-Create widget.
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  String? _emailAddressCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '회사 이메일 사용해주세요';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return '이메일 형식이 아닙니다.';
    }
    return null;
  }

  // State field(s) for password-Create widget.
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  // State field(s) for passwordConfirm-Create widget.
  TextEditingController? passwordConfirmCreateController;
  late bool passwordConfirmCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCreateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    emailAddressCreateControllerValidator =
        _emailAddressCreateControllerValidator;
    passwordCreateVisibility = false;
    passwordConfirmCreateVisibility = false;
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    nameCreateController?.dispose();
    emailAddressCreateController?.dispose();
    passwordCreateController?.dispose();
    passwordConfirmCreateController?.dispose();
  }

  /// Additional helper methods are added here.

}
