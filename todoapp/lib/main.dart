
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/changes.dart';
import 'firebase_options.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
    return MaterialApp(
      home: Scaffold(
        body: Changes(),
      ),
    );
  }
}

