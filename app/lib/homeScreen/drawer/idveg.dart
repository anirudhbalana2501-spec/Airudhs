import 'dart:ffi';

import 'package:flutter/material.dart';

class Idveg extends StatefulWidget {
  const Idveg({super.key});

  @override
  State<Idveg> createState() => _IdvegState();
}

class _IdvegState extends State<Idveg> {
  @override

 Widget buildTile(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.power_settings_new),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Veg Mode",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Veg dishes from",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            buildTile("All restaurant"),
            buildTile("Pure veg restaurant only"),

            const SizedBox(height: 25),

            const Text(
              "Select Veg Mode Days",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            buildTile("All days"),
            buildTile("Select Veg Mode Week"),

            const SizedBox(height: 20),

            /// Week Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ["S","M","T","W","T","F","S"]
                  .map((day) => CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.green.shade100,
                        child: Text(
                          day,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      )
                      )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

}
