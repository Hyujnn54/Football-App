import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyClLKnvhUF9kAmOrA-h4rLn52vit2D-hcg",
            authDomain: "football-kpk1v9.firebaseapp.com",
            projectId: "football-kpk1v9",
            storageBucket: "football-kpk1v9.firebasestorage.app",
            messagingSenderId: "515144821880",
            appId: "1:515144821880:web:380bbde71240b2336c518d"));
  } else {
    await Firebase.initializeApp();
  }
}
