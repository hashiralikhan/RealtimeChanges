
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/home.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
    Stream<QuerySnapshot<Object>> yourStream = FirebaseFirestore.instance.collection('posts').snapshots();


  @override
  Widget build(BuildContext context) {
     Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
        child:SafeArea(child:StreamBuilder<QuerySnapshot>(
      stream: yourStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return const Home();
          }).toList(),
        );
      },
    ))

        ),
      ),
    );

    
  }
}

