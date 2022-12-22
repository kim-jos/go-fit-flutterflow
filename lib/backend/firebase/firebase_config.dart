import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfLjFCVBG9ge8QnR5z7UoTp85Xh9fi_ow",
            authDomain: "customer-management-6f127.firebaseapp.com",
            projectId: "customer-management-6f127",
            storageBucket: "customer-management-6f127.appspot.com",
            messagingSenderId: "925942846141",
            appId: "1:925942846141:web:e1af3ef35f059e25a21dd4",
            measurementId: "G-9S1MQRWZFD"));
  } else {
    await Firebase.initializeApp();
  }
}
