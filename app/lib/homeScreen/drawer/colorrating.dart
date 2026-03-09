import 'package:flutter/material.dart';

class Colorrating extends StatelessWidget {
  const Colorrating({super.key});

  
  static Color getRatingColor(String? rating) {
    double rate = double.tryParse(rating ?? "0") ?? 0;

    if (rate >= 4.0) {
      return Color(0xFF2E7D32); // Dark Green
    }
     else if (rate >= 3.0) {
      return Color(0xFFFFA726); // Green
    }
    //  else if (rate >= 3.5) {
    //   return Color(0xFF7CB342); // Light Green
    // }
    //  else if (rate >= 3.0) {
    //   return Color(0xFFFFA726); // Orange
    // }
    //  else if (rate >= 2.0) {
    //   return Color(0xFFEF6C00); // Dark Orange
    // }
     else {
      return Color(0xFFC62828); // Red
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material();
  }
}