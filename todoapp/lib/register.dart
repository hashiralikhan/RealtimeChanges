import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  redirct() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ));
  }

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void regester() async {
    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await firestore.collection('Users').doc(credential.user!.uid).set({
        'name': username,
        'email': email,
      });
      redirct();
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Center(
        child: Column(
        
          children: [
            const SizedBox(
              height: 50,
              width: 50,
            ),

            SizedBox(
              width: 200,
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your username',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your E-mail',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: regester,
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
