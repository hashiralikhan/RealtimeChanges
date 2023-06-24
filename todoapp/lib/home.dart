
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container( 
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 1)
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",width: 100,height: 100,),
            const Text("this is tittle image"),
            const Text("this is description")
          ],
        ),
      ),
    );
  }
}