import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(home: HomePage()));
}
