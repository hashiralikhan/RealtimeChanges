import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void navigateFunction() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  void loginFunction() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      // ignore: unused_local_variable
      final UserCredential credential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      navigateFunction();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
              
                height: 20,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/pic1.png',
                ),
                backgroundColor: Colors.black,
                radius: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  // controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                ),
              ),
              ElevatedButton(
                  onPressed: loginFunction, child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
