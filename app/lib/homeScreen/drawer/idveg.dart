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
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Veg Mode", style: TextStyle(fontWeight: FontWeight.bold)),
  //     ),
  //     //backgroundColor: Colors.blueGrey,
  //     body: Padding(
  //       padding: const EdgeInsets.only(top: 10),
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.all(0),
  //             height: 410,
  //             width: 380,
  //             color: Colors.grey.shade200,
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 10),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 80),
  //                     child: Text(
  //                       "Veg dishes dishes from",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 20,
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 14),
  //                   Container(
  //                     padding: EdgeInsets.all(0),
  //                     height: 50,
  //                     width: 320,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 15),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(top: 10),
  //                             child: Row(
  //                               children: [
  //                                 SizedBox(width: 0),
  //                                 Text(
  //                                   "All restaurant",
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 Spacer(),
  //                                 Icon(
  //                                   Icons.power_settings_new,
  //                                   size: 27,
  //                                   color: Colors.red,
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 2),
  //                   Container(
  //                     padding: EdgeInsets.all(0),
  //                     height: 50,
  //                     width: 320,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 15),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(top: 10),
  //                             child: Row(
  //                               children: [
  //                                 // Icon(Icons.eco, size: 30, color: Colors.green),
  //                                 SizedBox(width: 0),
  //                                 Text(
  //                                   "Pure veg restaurant only",
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 SizedBox(width: 10),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 10),
  //                                   child: Center(
  //                                     child: Container(
  //                                       height: 8,
  //                                       width: 8,
  //                                       decoration: BoxDecoration(
  //                                         color: Colors.green,
  //                                         shape: BoxShape.circle,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                  Spacer(),
  //                                 Icon(Icons.power_settings_new, size: 27),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 20),

  //                   Padding(
  //                     padding: const EdgeInsets.only(right: 80),
  //                     child: Text(
  //                       "Select veg Mode days",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 20,
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 20),
  //                   Container(
  //                     padding: EdgeInsets.all(0),
  //                     height: 50,
  //                     width: 320,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 15),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(top: 10),
  //                             child: Row(
  //                               children: [
  //                                 // Icon(Icons.eco, size: 30, color: Colors.green),
  //                                 SizedBox(width: 0),
  //                                 Text(
  //                                   "All days",
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 SizedBox(width: 10),
  //                                 Icon(Icons.power_settings_new, size: 27),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 2),
  //                   Container(
  //                     padding: EdgeInsets.all(0),
  //                     height: 50,
  //                     width: 320,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(0),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 15),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(top: 10),
  //                             child: Row(
  //                               children: [
  //                                 // Icon(Icons.eco, size: 30, color: Colors.green),
  //                                 SizedBox(width: 0),
  //                                 Text(
  //                                   "Select Veg Mode Week",
  //                                   style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                                 SizedBox(width: 10),
  //                                 // Padding(
  //                                 //   padding: const EdgeInsets.only(top: 10),
  //                                 //   child: Center(
  //                                 //     child: Container(
  //                                 //       height: 8,
  //                                 //       width: 8,
  //                                 //       decoration: BoxDecoration(
  //                                 //         color: Colors.green,
  //                                 //         shape: BoxShape.circle,
  //                                 //       ),
  //                                 //     ),
  //                                 //   ),
  //                                 // ),
  //                                 SizedBox(width: 85),
  //                                 // Text("on"),
  //                                 //SizedBox(width: 5),
  //                                 Icon(Icons.power_settings_new, size: 27),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.all(0),
  //                     height: 60,
  //                     width: 320,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(0),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(2),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only( bottom: 10),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "S",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                  CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "M",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                  CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "T",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
  //                                 ), CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "W",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                  CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "T",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                  CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "F",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
                                    
  //                                 ),
  //                                  CircleAvatar(
  //                                   radius: 20,
  //                                   backgroundColor: Colors.blue.shade100,
  //                                   child: const Text(
  //                                     "S",
  //                                     style: TextStyle(
  //                                       fontSize: 20,
  //                                       color: Colors.blue,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //\   );
 // }
}
