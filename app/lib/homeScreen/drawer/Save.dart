import 'package:flutter/material.dart';

class Save extends StatefulWidget {
  const Save({super.key});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122,
      width: 223,
      color: Colors.blueAccent,
      child: Text("data"),
    );
  }
}