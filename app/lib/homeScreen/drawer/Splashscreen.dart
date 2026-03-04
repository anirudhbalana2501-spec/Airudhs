import 'dart:async';

import 'package:app/homeScreen/drawer/logine.dart';
import 'package:app/homeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
      checkLogin();

  }
  Future<void> checkLogin() async {
  await Future.delayed(Duration(seconds: 3));

  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  if (isLoggedIn) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Homescreen(name: "anirudh", password: "123456"),
      ),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Logine()),
    );
  }
}



//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Logine()),
//       );
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
  }

//  Timer( Duration(seconds: 3),(){
//   Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(builder: (context)=> const Logine())
//   );
//  });

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.amber.shade200,
//     body: Center(child: Image.asset('assets/images/logo.png')),
//   );
// }
