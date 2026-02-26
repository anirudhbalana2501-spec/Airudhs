import 'dart:async';

import 'package:app/homeScreen/homescreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
   @override
  void initState() {
    super.initState();
       
     Timer( Duration(seconds: 3),(){
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=> const Homescreen())
      );
     });  

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: Center(
        child: Image.asset('assets/images/logo.png')
      ),
    );
  }
}