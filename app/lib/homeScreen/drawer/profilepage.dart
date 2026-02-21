import 'dart:ffi';
import 'dart:math';

import 'package:app/homeScreen/drawer/id2.dart';
import 'package:app/homeScreen/drawer/idveg.dart';
import 'package:app/homeScreen/drawer/payment.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void di() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }

    void veg() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Idveg()));
    }
void payment() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Payment()));
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //leading: Icon(Icons.arrow_back, color: Colors.black),
      //),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: di,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue.shade100,
                        child: Text(
                          "A",
                          style: TextStyle(fontSize: 25, color: Colors.blue),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "anirudh",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: di,
                          child: Text(
                            "Edit profile >",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Container(
                      padding: EdgeInsets.all(0),
                      height: 80,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.amber,
                            blurStyle: BlurStyle.solid,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.workspace_premium,
                              color: Colors.amber,
                              size: 29,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            "Premium Access",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 15),
              //   padding: EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         children: [
              //           Icon(Icons.workspace_premium, color: Colors.amber),
              //           SizedBox(width: 10),
              //           Text(
              //             "Join  premium",
              //             style: TextStyle(
              //               color: Colors.amber,
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         color: Colors.amber,
              //         size: 16,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          height: 80,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                  Image.asset('assets/images/icons8-wallet-100.png', scale: 3,),
                                  SizedBox(width: 10,),
                                      Text(
                                        "Zomato Money",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text(
                                    "₹10",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          height: 80,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/icons8-gift-box-100.png', scale: 3, color: Colors.amber,),
                                      SizedBox(width: 10,),
                                      Text(
                                        "Your Rewards",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text(
                                    ">",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text(
                  "Your preferences",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),

              GestureDetector(
                onTap: veg,
                child: Container(
                  padding: EdgeInsets.all(0),
                  height: 70,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.eco, size: 30, color: Colors.green),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Veg Mode",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 134),
                        // Text("on"),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_right, size: 27),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons8-artist-palette-100.png',
                        scale: 3,
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Center(
                      //     child: Container(
                      //       height: 8,
                      //       width: 8,
                      //       decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 20),
                      Text(
                        "Appearance",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 95),
                      Text("Light"),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_right, size: 27),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              GestureDetector(
                onTap: payment, child: 
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons8-wallet-100.png',
                        scale: 3,
                      ),
                      //Icon(Icons.wallet, size: 30, color: Colors.green),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Center(
                      //     child: Container(
                      //       height: 8,
                      //       width: 8,
                      //       decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 20),
                      Text(
                        "Payment menthods",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 80),
                      //Text("on"),
                      //SizedBox(width: 5),
                      Icon(Icons.arrow_right, size: 27),
                    ],
                  ),
                ),
              ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text(
                  "Food delivery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons8-purchase-order-100.png',
                        scale: 2.8,
                      ),
                      //    Icon(Icons.panorama_vertical_select, size: 30, color: Colors.green),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Center(
                      //     child: Container(
                      //       height: 8,
                      //       width: 8,
                      //       decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 20),
                      Text(
                        "your order",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 135),
                      // Text("on"),
                      // SizedBox(width: 5),
                      Icon(Icons.arrow_right, size: 27),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons8-address-book-100.png',
                        height: 30,
                        width: 30,
                        color: Colors.green,
                        // fit: BoxFit.contain,
                      ),

                      //Image.asset('assets/images/icons8-address-book-100.png', scale: 7,),
                      // Icon(Icons.eco, size: 30, color: Colors.green),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Center(
                      //     child: Container(
                      //       height: 8,
                      //       width: 8,
                      //       decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 20),
                      Text(
                        "Address Book",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 110),
                      //Text("on"),
                      //SizedBox(width: 5),
                      Icon(Icons.arrow_right, size: 27),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons8-train-100.png',
                        height: 40,
                        width: 40,
                        color: Colors.green,
                        // fit: BoxFit.contain,
                      ),

                      //Image.asset('assets/images/icons8-address-book-100.png', scale: 7,),
                      // Icon(Icons.eco, size: 30, color: Colors.green),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Center(
                      //     child: Container(
                      //       height: 8,
                      //       width: 8,
                      //       decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         shape: BoxShape.circle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 20),
                      Text(
                        "Oder on train",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 110),
                      //Text("on"),
                      //SizedBox(width: 5),
                      Icon(Icons.arrow_right, size: 27),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              Container(
                padding: EdgeInsets.all(0),
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icons8-help-100.png',
                        height: 40,
                        width: 40,
                        // color: Colors.green,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "online oder help",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 90),
                      //Text("on"),
                      //SizedBox(width: 5),
                      Icon(Icons.arrow_right, size: 27),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text(""),
              ),
              SizedBox(height: 20),

              // SizedBox(height: 15),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     children: [
              //       Expanded(child: infoSmallCard("Zomato Money", "₹10")),
              //       SizedBox(width: 10),
              //       Expanded(child: infoSmallCard("Your coupons", ">")),
              //     ],
              //   ),
              // ),

              // SizedBox(height: 20),

              // // 🔹 Preferences Section
              // sectionTitle("Your preferences"),

              // optionTile(Icons.circle, "Veg Mode", trailing: "On"),
              // optionTile(Icons.star_border,"Show personalised ratings",
              // //isSwitch: false,
              // ),
              // optionTile(Icons.palette, "Appearance", trailing: "Light"),
              // optionTile(Icons.payment, "Payment methods"),

              // SizedBox(height: 20),

              // // 🔹 Food Delivery Section
              // sectionTitle("Food delivery"),

              // optionTile(Icons.receipt_long, "Your orders"),
              // optionTile(Icons.location_on_outlined, "Address book"),

              //SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Small Card
  Widget infoSmallCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
        ],
      ),
    );
  }

  // 🔹 Section Title
  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 🔹 Option Tile
  Widget optionTile(
    IconData icon,
    String title, {
    String? trailing,
    bool isSwitch = true,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 15),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.black54),
            SizedBox(width: 15),
            Expanded(child: Text(title, style: TextStyle(fontSize: 15))),
            SizedBox(width: 10),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(trailing, style: TextStyle(color: Colors.grey)),
              ),
            //if (isSwitch) Switch(value: true, onChanged: (val) {}),
            ///if (!isSwitch && trailing == null)
            SizedBox(height: 10),
            Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ),
    );
  }
}
