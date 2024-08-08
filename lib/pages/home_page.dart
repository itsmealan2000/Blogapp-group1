import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Center(
        child:  Text(
          "Hello App",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
