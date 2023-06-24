import 'package:flutter/material.dart';
import 'package:todoapp/login.dart';
import 'package:todoapp/register.dart';

class Tablog extends StatefulWidget {
  const Tablog({super.key});

  @override
  State<Tablog> createState() => _TablogState();
}

class _TablogState extends State<Tablog> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: const TabBar(
          
          unselectedLabelColor: Colors.black54,
          labelColor: Colors.orange,
          indicatorColor: Colors.orange,
          tabs: [
          Tab(child: Text("Login"),),
          Tab(child: Text("Register"),)
        ]),
      ),

      body: const TabBarView(children: [
        Login(),
        Register()

      ]),
    )
    );
  }
}