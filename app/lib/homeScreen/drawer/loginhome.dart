import 'package:flutter/material.dart';

class LoginhomeScreen extends StatelessWidget {
  final String name;
  final String password; 

  const LoginhomeScreen({super.key, required this.name, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(
          "Welcome $name ",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}