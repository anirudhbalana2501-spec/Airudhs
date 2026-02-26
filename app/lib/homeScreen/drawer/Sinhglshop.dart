//import 'package:app7/src/screen/GalleryScreen.dart';
//import 'package:app7/src/screen/MenuScreen.dart';
//import 'package:app7/src/screen/ReviewScreen.dart';
//import 'dart:ffi';

import 'package:app/homeScreen/drawer/Dashboard.dart';
import 'package:app/homeScreen/drawer/inform.dart';
import 'package:app/homeScreen/drawer/three.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// ignore: must_be_immutable
class SingleShopScreen extends StatefulWidget {
  String? pname;
  String? image;
  String? location;
  String? shop;
  List<Map<String, dynamic>>? menuitem;
  SingleShopScreen({
    super.key,
    this.pname,
    this.image,
    this.location,
    this.menuitem,
    this.shop,
  });

  @override
  State<SingleShopScreen> createState() => _SingleShopScreenState();
}

class _SingleShopScreenState extends State<SingleShopScreen> {
  bool isVisible = true;

  // call() {
  //   UrlLauncher.launch("tel://9784837939");
  // }

  // Whatsapp() async {
  //   var whatsapp = "+919784837939";
  //   var whatsappAndroid =
  //       Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
  //   if (await UrlLauncher.canLaunchUrl(whatsappAndroid)) {
  //     await UrlLauncher.launchUrl(whatsappAndroid);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("WhatsApp is not installed on the device"),
  //       ),
  //     );
  //   }
  // }

  // MenuItem(menuitem) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => MenuScreen(menuitem: menuitem),
  //     ),
  //   );
  // }

  // Gallery() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => GalleryScreen(),
  //     ),
  //   );
  // }

  // Reviews() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => ReviewScreen(),
  //     ),
  //   );
  // }
  void inf() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Inform()));
  }

  void hom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  void thr() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Three()));
  }

  void menu() {
    print("Menu");

    // setState(() {
    //   isManu = false;
    // });
    // (() {});
  }

  void review() {
    print("Reviews");
  }

  void gallery() {
    print("Gallery");
  }

  bool isManuOpen = false;
  bool isThaliOpen = false;

  // ignore: non_constant_identifier_names
  List<String> Thali = [
    "assets/images/manu/dal-makhani.jpg",
    "assets/images/manu/dal-tadka.jpg",
    "assets/images/manu/dosa-with-chutney-and-sambar.jpg",
    "assets/images/manu/idly.jpg",
    "assets/images/manu/masala-shahi-paneer.jpg",
    "assets/images/manu/mini-idli-fry.jpg",
    "assets/images/manu/tadka-daal.jpg",
  ];

  List<String> mane = [
    "dal makhani",
    "dal tadka",
    "dosa",
    "idly",
    "masala shahi paneer",
    "mini idli fry",
    "tadka daal",
  ];

  @override
  Widget build(BuildContext context) {
    var menuitem1 = (widget.menuitem);

    //if (ismanu) if (ismanu) const Icon(Icons.keyboard_arrow_down);

    //print("ismanu",ismanu);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: AppBar(
      // title: Text("${widget.pname}"),
      //),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: hom,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  // Icon(Icons.arrow_back_ios, size: 30),
                  SizedBox(width: 70),
                  Container(
                    padding: EdgeInsets.all(0),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text("Search"),
                          SizedBox(width: 20),
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 70),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(context: context, 
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context){return Three();});
                    },
                    child: Icon(Icons.more_vert_outlined),
                  ),
                  //Icon(Icons.more_vert_outlined),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    color: Colors.black26,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: inf,
                          child: Image.asset(
                            widget.image ?? "assets/default.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${widget.pname}",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),

                        GestureDetector(
                          onTap: inf,
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 15,
                            child: Text("i"),
                          ),
                        ),
                        SizedBox(height: 5),

                        Text(
                          "${widget.location}",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(height: 6),

                        Row(
                          children: [
                            Text(
                              " Near & Fast",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 14),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                padding: EdgeInsets.all(0),
                                height: 45,
                                width: 39,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.date_range_sharp,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            SizedBox(width: 17),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("08:00 - 23:30\nMonday - Sunday"),
                            ),
                            SizedBox(width: 40),
                            Container(
                              padding: EdgeInsets.all(0),
                              height: 45,
                              width: 39,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.call, color: Colors.green),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),

                        SizedBox(height: 0),
                        Row(
                          children: [
                            Text(
                              "30% Off ",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 200),

                            // Container(
                            //   padding: EdgeInsets.all(0),
                            //   height: 40,
                            //   width: 39,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     border: Border.all(
                            //       width: 1,
                            //       color: Colors.black,
                            //     ),
                            //     borderRadius: BorderRadius.circular(20),
                            //   ),
                            //   child: Icon(Icons.call, color: Colors.black87),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0,
                    width: w,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    height: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/images/pngwing.com (3).png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("25% OFF up to 100"),
                        ),
                        SizedBox(width: 120),
                        Text("offers"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                GestureDetector(
                  onTap: menu,
                  // ismanu: true,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                   // height: 480,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    "Menu",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 250),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isManuOpen = !isManuOpen;
                                    });
                                  },
                                  child:
                                   AnimatedRotation(
                                    turns: isManuOpen ? 0.5 : 0,
                                    duration: Duration(milliseconds: 250),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.black12,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 25,
                                      ),
                                    ),
                                  ),


                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          if (isManuOpen)
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    //   borderRadius: BorderRadius.circular(20),
                                    //   boxShadow: [
                                    //     BoxShadow(
                                    //       color: Colors.black12,
                                    //       blurRadius: 10,
                                    //       spreadRadius: 2,
                                    //     ),
                                    //   ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recommended for you",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text(
                                            "THALI",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(width: 230),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isThaliOpen = !isThaliOpen;
                                              });
                                            },
                                            child: AnimatedRotation(
                                              turns: isThaliOpen ? 0.5 : 0,
                                              duration: Duration(
                                                milliseconds: 250,
                                              ),
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                    Colors.amberAccent,

                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 25,
                                                ),
                                              ),
                                            ),

                                            // Icon(Icons.arrow_drop_down, size: 30),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 15),
                                      if (isThaliOpen)
                                        Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.green,
                                                        size: 18,
                                                      ),

                                                      SizedBox(height: 10),

                                                      Text(
                                                        "Paneer Butter Masala\n[300 ml] with 3 Tandoori Roti",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),

                                                      SizedBox(height: 10),

                                                      Text(
                                                        "₹180",
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.grey,
                                                          fontSize: 16,
                                                        ),
                                                      ),

                                                      Text(
                                                        "Get for ₹169",
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),

                                                      SizedBox(height: 10),

                                                      Text(
                                                        "NOT ELIGIBLE FOR COUPONS",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                SizedBox(width: 10),

                                                /// RIGHT SIDE IMAGE + BUTTON
                                                Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            15,
                                                          ),
                                                      child: Image.asset(
                                                        "assets/images/manu/thali/istockphoto-1458973879-2048x2048.jpg", // apni image lagao
                                                        height: 120,
                                                        width: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),

                                                    SizedBox(height: 10),

                                                    /// ADD BUTTON (2 COLOR)
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 30,
                                                            vertical: 10,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),

                                                        gradient:
                                                            LinearGradient(
                                                              colors: [
                                                                Colors.green,
                                                                Colors
                                                                    .lightGreen,
                                                              ],
                                                            ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "ADD",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 18,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.grey.shade300,
                                              thickness: 1,
                                              height: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                //   borderRadius: BorderRadius.circular(20),
                                                //   boxShadow: [
                                                //     BoxShadow(
                                                //       color: Colors.black12,
                                                //       blurRadius: 10,
                                                //       spreadRadius: 2,
                                                //     ),
                                                //   ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      /// LEFT SIDE TEXT
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons.circle,
                                                              color:
                                                                  Colors.green,
                                                              size: 18,
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "Paneer Butter Masala\n[300 ml] with 3 Tandoori Roti",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "₹180",
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 16,
                                                              ),
                                                            ),

                                                            Text(
                                                              "Get for ₹169",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "NOT ELIGIBLE FOR COUPONS",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(width: 10),

                                                      /// RIGHT SIDE IMAGE + BUTTON
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 20,
                                                            ),
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    15,
                                                                  ),
                                                              child: Image.asset(
                                                                "assets/images/manu/thali/istockphoto-803757626-612x612.jpg",
                                                                height: 120,
                                                                width: 120,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            /// ADD BUTTON (2 COLOR)
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),

                                                                gradient: LinearGradient(
                                                                  colors: [
                                                                    Colors
                                                                        .green,
                                                                    Colors
                                                                        .lightGreen,
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "ADD",
                                                                    style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Divider(
                                              color: Colors.grey.shade300,
                                              thickness: 1,
                                              height: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                //   borderRadius: BorderRadius.circular(20),
                                                //   boxShadow: [
                                                //     BoxShadow(
                                                //       color: Colors.black12,
                                                //       blurRadius: 10,
                                                //       spreadRadius: 2,
                                                //     ),
                                                //   ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      /// LEFT SIDE TEXT
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons.circle,
                                                              color:
                                                                  Colors.green,
                                                              size: 18,
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "Paneer Butter Masala\n[300 ml] with 3 Tandoori Roti",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "₹180",
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 16,
                                                              ),
                                                            ),

                                                            Text(
                                                              "Get for ₹169",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "NOT ELIGIBLE FOR COUPONS",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(width: 10),

                                                      /// RIGHT SIDE IMAGE + BUTTON
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 20,
                                                            ),
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    15,
                                                                  ),
                                                              child: Image.asset(
                                                                "assets/images/manu/thali/5f19d2a017c3176f018adef73dc96e5d.avif",
                                                                height: 120,
                                                                width: 120,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            /// ADD BUTTON (2 COLOR)
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        30,
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      12,
                                                                    ),

                                                                gradient: LinearGradient(
                                                                  colors: [
                                                                    Colors
                                                                        .green,
                                                                    Colors
                                                                        .lightGreen,
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "ADD",
                                                                    style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            

                                          ],
                                        ),

                                       Text("data", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),) 
                                    ],
                                  ),
                                ),

                                // Container(
                                //   padding: EdgeInsets.all(0),
                                //   height: 90,
                                //   width: 120,
                                //   color: Colors.amber,
                                //   child: Text("data"),

                                // )
                                //
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3),
                GestureDetector(
                  onTap: review,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Reviews",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, size: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3),

                GestureDetector(
                  onTap: gallery,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Gallery",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, size: 30),
                        // Container(
                        //   child: ElevatedButton(
                        //     onPressed: Gallery,
                        //     child: Icon(Icons.arrow_circle_right),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "It offers dishes like Chinese, South Indian, Fast Food, Coffee Shop and Non Veg, and some others mouth watering dishes that make you feel delighted. Besides.",
                style: TextStyle(),
                textAlign: TextAlign.justify, //----
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(0),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/res1.png',
                fit: BoxFit.cover,
                scale: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
