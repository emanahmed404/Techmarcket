import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/app.dart';

late SharedPreferences sharedPreferences;
late bool internetChecker;
dynamic blueColor = Color.fromRGBO(133, 205, 249, 0.8);
dynamic cyan = Color.fromRGBO(169, 131, 241, 0.8);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

