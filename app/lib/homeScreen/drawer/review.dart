import 'package:flutter/material.dart';

class Aaaa extends StatefulWidget {
  const Aaaa({super.key});

  @override
  State<Aaaa> createState() => _AaaaState();
}

class _AaaaState extends State<Aaaa> {
  void review() {
    print("review");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                GestureDetector(onTap: review, child:  Icon(Icons.arrow_drop_down, size: 30),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
