// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> doesReferralCodeExist(String referralCode) async {
  // Add your function code here!
  final result = FirebaseFirestore.instance
      .collection('users')
      .where('referralCode', isEqualTo: referralCode)
      .limit(1);

  final document = await result.get();
  if (document.size == 1) {
    return document.docs[0].reference;
  }
  return null;
}
