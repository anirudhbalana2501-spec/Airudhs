import 'dart:ffi';

import 'package:flutter/material.dart';

class Inform extends StatefulWidget {
  String? pname;
  Inform({super.key, this.pname});

  @override
  State<Inform> createState() => _InformState();
}

class _InformState extends State<Inform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            /// TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios, size: 18),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.bookmark_border),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Container(
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.pname}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "North Indian • ₹150 for one",
                              style: TextStyle(color: Colors.grey),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Opposite Railway Station, Gopalbari, Jaipur",
                              style: TextStyle(fontSize: 14),
                            ),

                            SizedBox(height: 15),

                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.call, color: Colors.green),
                                // buildCircleIcon
                                // (Icons.call, Colors.green),
                                Icon(Icons.directions),
                                // buildCircleIcon(Icons.directions, Colors.blue),
                                Icon(Icons.share),
                                //buildCircleIcon(Icons.share, Colors.orange),
                              ],
                            ),

                            SizedBox(height: 15),
                            Divider(),
                            Row(
                              children: [
                                Icon(Icons.access_time), 
                                SizedBox(width: 20,),
                                 Text("Open now • Closes 11:59 PM")
                                ],
                            ),
                            SizedBox(height: 10,),

                            //buildInfoRow(
                            //Icons.access_time,
                            //"Open now • Closes 11:59 PM",
                            // Colors.green,
                            //),
                            Row(
                              children: [
                                Icon(Icons.store),
                                SizedBox(width: 20,),
                                Text("Provides both delivery & dining"),
                              ],
                            ),
                            SizedBox(height: 10,),
                            // buildInfoRow(
                            //   Icons.store,
                            //   "Provides both delivery & dining",
                            //   Colors.black,
                            // ),
                            Row(children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 20,),
                              Text("Live since 2021")
                              ]),
                            // buildInfoRow(
                            //   Icons.calendar_today,
                            //   "Live since 2021",
                            //   Colors.black,
                            // ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      /// BAD EXPERIENCE CARD
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Had a bad experience here?"),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      /// LEGAL INFO
                      Text(
                        "Legal Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Text("${widget.pname}",
                          textAlign: TextAlign.justify,
                          ),
                          
                        
                        ],
                      ),
                      Row(
                        children: [Text("GST Number"), Text("08XXXXXXXX1ZV")],
                      ),
                      Row(children: [Text("FSSAI"), Text("22225067008081")]),
                      //buildLegalRow("GST Number", "08XXXXXXXX1ZV"),
                      //buildLegalRow("FSSAI", "22225067008081"),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: Text("Go back to menu", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
