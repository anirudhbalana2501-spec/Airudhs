import 'package:flutter/material.dart';

class Sinhg extends StatefulWidget {
  const Sinhg({super.key});

  @override
  State<Sinhg> createState() => _SinhgState();
}

class _SinhgState extends State<Sinhg> {
  void aaa() {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              GestureDetector(
                onTap: aaa,
                // ismanu: true,
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 480,
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 250),
                              CircleAvatar(
                                radius: 15,
          
                                backgroundColor: Colors.black12,
          
                                child: Icon(Icons.arrow_drop_down, size: 25),
                              ),
          
                              //Icon(Icons.arrow_drop_down, size: 30),
                              //Icon(Icons.abc)
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
          
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.amberAccent,
          
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          size: 25,
                                        ),
                                      ),
                                      // Icon(Icons.arrow_drop_down, size: 30),
                                    ],
                                  ),
          
                                  SizedBox(height: 15),
          
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
          
                                            SizedBox(height: 10),
          
                                            Text(
                                              "₹180",
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize: 16,
                                              ),
                                            ),
          
                                            Text(
                                              "Get for ₹169",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
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
                                            borderRadius: BorderRadius.circular(
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
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 30,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                12,
                                              ),
          
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.green,
                                                  Colors.lightGreen,
                                                ],
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "ADD",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
