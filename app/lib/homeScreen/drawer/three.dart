import 'dart:ui';
import 'package:app/homeScreen/drawer/inform.dart';
import 'package:app/homeScreen/drawer/search.dart';
import 'package:flutter/material.dart';

class Three extends StatelessWidget {
  const Three({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Material(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                leading: Icon(Icons.bookmark_border),
                title: Text("Add to Collection"),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Searchitem()),
                    );
                  });
                },
              ),
            ),

            SizedBox(height: 10),

            Material(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("See more about this restaurant"),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 200), (){
                    Navigator.push(
                     context, 
                     MaterialPageRoute(builder: (context) => Inform())
                    );
                  });
                },
              ),
            ),

            SizedBox(height: 10),

            Material(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                leading: Icon(Icons.reply),
                title: Text("Share this restaurant"),
                onTap: () {},
              ),
            ),

            SizedBox(height: 10),

            Material(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                leading: Icon(Icons.visibility_off),
                title: Text("Hide this restaurant"),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

