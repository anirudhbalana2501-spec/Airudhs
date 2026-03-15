

import 'dart:async';
import 'package:app/homeScreen/drawer/cart_data.dart';
import 'package:app/homeScreen/drawer/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryDetailScreen extends StatefulWidget {
  final OrderHistory order;
  const DeliveryDetailScreen({super.key, required this.order});

  @override
  State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  bool _isCancelled = false;
  Timer? _locationTimer;

  // ✅ Delivery boy ki fake starting location
  double deliveryLat = 26.9100;
  double deliveryLng = 70.9000;

  // ✅ User ki location
  double get uLat => userLat ?? 26.9157;
  double get uLng => userLng ?? 70.9083;

  final List<Map<String, dynamic>> deliveryBoys = const [
    {"naam": "Rahul Kumar", "number": "9876543210", "rating": "4.8", "time": "25-30"},
    {"naam": "Amit Sharma", "number": "9876512345", "rating": "4.5", "time": "30-35"},
    {"naam": "Ravi Singh", "number": "9812345678", "rating": "4.2", "time": "20-25"},
  ];

  @override
  void initState() {
    super.initState();
    _isCancelled = widget.order.isCancelled;

    // ✅ Har 2 second mein delivery boy ki location update karo
    _locationTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        // ✅ Slowly user ki taraf move karo
        deliveryLat += (uLat - deliveryLat) * 0.05;
        deliveryLng += (uLng - deliveryLng) * 0.05;
      });
    });
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    super.dispose();
  }

  void call(String number) async {
    var phone = Uri.parse("tel://$number");
    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    }
  }

  void cancelOrder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Order Cancel Karo?"),
        content: Text("Kya aap ye order cancel karna chahte ho?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Nahi"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              int index = orderHistory.indexOf(widget.order);
              if (index != -1) {
                setState(() {
                  orderHistory[index].isCancelled = true;
                  _isCancelled = true;
                });
                await saveOrderHistory();
              }
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Order cancel ho gaya! ❌")),
              );
            },
            child: Text("Cancel Order", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final boy = deliveryBoys[DateTime.now().second % deliveryBoys.length];
    final difference = DateTime.now().difference(widget.order.date);
    final remainingSeconds = 300 - difference.inSeconds;
    final canCancel = remainingSeconds > 0 && !_isCancelled;

    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Detail 🛵", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [

          // ✅ UPAR - MAP
          Container(
            height: 300,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                  (uLat + deliveryLat) / 2,
                  (uLng + deliveryLng) / 2,
                ),
                initialZoom: 14,
              ),
              children: [
                // ✅ Map tiles
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),

                // ✅ Markers
                MarkerLayer(
                  markers: [
                    // ✅ User ki location
                    Marker(
                      point: LatLng(uLat, uLng),
                      width: 50,
                      height: 50,
                      child: Column(
                        children: [
                          Icon(Icons.home, color: Colors.blue, size: 30),
                          Text("Aap", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue)),
                        ],
                      ),
                    ),

                    // ✅ Delivery boy ki location
                    Marker(
                      point: LatLng(deliveryLat, deliveryLng),
                      width: 60,
                      height: 50,
                      child: Column(
                        children: [
                          Icon(Icons.delivery_dining, color: Colors.orange, size: 30),
                          Text("Delivery", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ✅ NICHE - DETAILS
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [

                  // ✅ Delivery boy card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.green.shade100,
                          child: Icon(Icons.person, size: 40, color: Colors.green),
                        ),
                        SizedBox(height: 8),
                        Text(
                          boy["naam"],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(boy["rating"], style: TextStyle(fontSize: 15)),
                            Text(" / 5.0", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 12),

                        // ✅ Estimated time
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer, color: Colors.green),
                              SizedBox(width: 8),
                              Text(
                                "Estimated Time: ${boy["time"]} min",
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),

                        // ✅ Call button
                        GestureDetector(
                          onTap: () => call(boy["number"]),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(colors: [Colors.green, Colors.lightGreen]),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.call, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    "Call: ${boy["number"]}",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),

                  // ✅ Cancelled status
                  if (_isCancelled)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.cancel, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              "Order Cancel Ho Gaya! ❌",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // ✅ Cancel button
                  if (canCancel)
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: GestureDetector(
                        onTap: cancelOrder,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.cancel, color: Colors.red),
                                SizedBox(width: 8),
                                Text(
                                  "Cancel Order",
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:app/homeScreen/drawer/cart_data.dart';
// import 'package:app/homeScreen/drawer/location.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class DeliveryDetailScreen extends StatefulWidget {
//   final OrderHistory order; // ✅ order add karo
//   // final double? userLat; // ✅ add karo
//   //final double? userLng;
//   const DeliveryDetailScreen({
//     super.key,
//     required this.order,
//     // this.userLat, // ✅
//     //this.userLng,
//   });

//   @override
//   State<DeliveryDetailScreen> createState() => _DeliveryDetailScreenState();
// }

// class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
//   bool _isCancelled = false;

//   final List<Map<String, dynamic>> deliveryBoys = const [
//     {
//       "naam": "Rahul Kumar",
//       "number": "9876543210",
//       "rating": "4.8",
//       "time": "25-30",
//     },
//     {
//       "naam": "Amit Sharma",
//       "number": "9876512345",
//       "rating": "4.5",
//       "time": "30-35",
//     },
//     {
//       "naam": "Ravi Singh",
//       "number": "9812345678",
//       "rating": "4.2",
//       "time": "20-25",
//     },
//   ];


//   void openDeliveryLocation() async {
//   // ✅ Fake delivery boy location
//   var url = Uri.parse(
//     "geo:26.9157,70.9083?q=26.9157,70.9083(Delivery+Boy)"
//   );
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   }
// }



//   @override
//   void initState() {
//     super.initState();
//     _isCancelled = widget.order.isCancelled; // ✅
//   }

//   void openUserLocation() async {
//     // ✅ Saved location use karo
//     double lat = userLat ?? 26.9157;
//     double lng = userLng ?? 70.9083;

//     var url = Uri.parse("geo:$lat,$lng?q=$lat,$lng(Meri+Location)");
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     }
//   }

//   void call(String number) async {
//     var phone = Uri.parse("tel://$number");
//     if (await canLaunchUrl(phone)) {
//       await launchUrl(phone);
//     }
//   }

//   // ✅ Cancel order
//   void cancelOrder() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Order Cancel Karo?"),
//         content: Text("Kya aap ye order cancel karna chahte ho?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Nahi"),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             onPressed: () async {
//               int index = orderHistory.indexOf(widget.order);
//               if (index != -1) {
//                 setState(() {
//                   orderHistory[index].isCancelled = true;
//                   _isCancelled = true; // ✅
//                 });
//                 await saveOrderHistory();
//               }
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Order cancel ho gaya! ❌")),
//               );
//             },
//             child: Text("Cancel Order", style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final boy = deliveryBoys[DateTime.now().second % deliveryBoys.length];
//     final difference = DateTime.now().difference(widget.order.date);
//     final remainingSeconds = 300 - difference.inSeconds;
//     final canCancel = remainingSeconds > 0 && !_isCancelled;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Delivery Detail 🛵",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // ✅ Delivery boy card
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//               ),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.green.shade100,
//                     child: Icon(Icons.person, size: 50, color: Colors.green),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     boy["naam"],
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         boy["rating"],
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(" / 5.0", style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.green.shade50,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.green),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.timer, color: Colors.green),
//                         SizedBox(width: 8),
//                         Text(
//                           "Estimated Time: ${boy["time"]} min",
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 16),

//                   // ✅ Call button
//                   GestureDetector(
//                     onTap: () => call(boy["number"]),
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         gradient: LinearGradient(
//                           colors: [Colors.green, Colors.lightGreen],
//                         ),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.call, color: Colors.white),
//                             SizedBox(width: 8),
//                             Text(
//                               "Call: ${boy["number"]}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 20),

//                   SizedBox(height: 10),

//                   // ✅ User location button
//                   GestureDetector(
//                     onTap: openUserLocation,
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         gradient: LinearGradient(
//                           colors: [Colors.blue, Colors.lightBlue],
//                         ),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.my_location, color: Colors.white),
//                             SizedBox(width: 8),
//                             Text(
//                               "Meri Location 📍",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 10),

//                   // ✅ Delivery boy location button
//                   GestureDetector(
//                     onTap: openDeliveryLocation,
//                     child: Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         gradient: LinearGradient(
//                           colors: [Colors.orange, Colors.deepOrange],
//                         ),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.delivery_dining, color: Colors.white),
//                             SizedBox(width: 8),
//                             Text(
//                               "Delivery Boy Location 🛵",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 16),

//             // ✅ Cancelled status
//             if (_isCancelled)
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.red.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.red),
//                 ),
//                 child: Center(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.cancel, color: Colors.red),
//                       SizedBox(width: 8),
//                       Text(
//                         "Order Cancel Ho Gaya! ❌",
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//             // ✅ Cancel button - 5 min tak
//             if (canCancel)
//               Padding(
//                 padding: EdgeInsets.only(top: 16),
//                 child: GestureDetector(
//                   onTap: cancelOrder,
//                   child: Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.symmetric(vertical: 14),
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade50,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.red),
//                     ),
//                     child: Center(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.cancel, color: Colors.red),
//                           SizedBox(width: 8),
//                           Text(
//                             "Cancel Order",
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// // import 'package:app/homeScreen/drawer/cart_data.dart';
// // import 'package:app/homeScreen/drawer/ordertriking.dart';
// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class DeliveryDetailScreen extends StatelessWidget {
// //   final OrderHistory order;
// //    DeliveryDetailScreen({super.key, required OrderTrackingScreen order, this.order});

// //   // ✅ Fake delivery boys ka data
// //   final List<Map<String, dynamic>> deliveryBoys = const [
// //     {"naam": "Rahul Kumar", "number": "9876543210", "rating": "4.8", "time": "25-30"},
// //     {"naam": "Amit Sharma", "number": "9876512345", "rating": "4.5", "time": "30-35"},
// //     {"naam": "Ravi Singh", "number": "9812345678", "rating": "4.2", "time": "20-25"},
// //   ];

// //   void call(String number) async {
// //     var phone = Uri.parse("tel://$number");
// //     if (await canLaunchUrl(phone)) {
// //       await launchUrl(phone);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // ✅ Random delivery boy select karo
// //     final boy = deliveryBoys[DateTime.now().second % deliveryBoys.length];

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Delivery Detail 🛵", style: TextStyle(fontWeight: FontWeight.bold)),
// //         backgroundColor: Colors.white,
// //         foregroundColor: Colors.black,
// //         elevation: 0,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           children: [

// //             // ✅ Delivery boy card
// //             Container(
// //               width: double.infinity,
// //               padding: EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(12),
// //                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
// //               ),
// //               child: Column(
// //                 children: [
// //                   // ✅ Icon
// //                   CircleAvatar(
// //                     radius: 40,
// //                     backgroundColor: Colors.green.shade100,
// //                     child: Icon(Icons.person, size: 50, color: Colors.green),
// //                   ),
// //                   SizedBox(height: 12),

// //                   // ✅ Naam
// //                   Text(
// //                     boy["naam"],
// //                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                   ),
// //                   SizedBox(height: 6),

// //                   // ✅ Rating
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(Icons.star, color: Colors.amber, size: 20),
// //                       SizedBox(width: 4),
// //                       Text(
// //                         boy["rating"],
// //                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
// //                       ),
// //                       Text(" / 5.0", style: TextStyle(color: Colors.grey)),
// //                     ],
// //                   ),
// //                   SizedBox(height: 16),

// //                   // ✅ Estimated time
// //                   Container(
// //                     width: double.infinity,
// //                     padding: EdgeInsets.all(12),
// //                     decoration: BoxDecoration(
// //                       color: Colors.green.shade50,
// //                       borderRadius: BorderRadius.circular(8),
// //                       border: Border.all(color: Colors.green),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Icon(Icons.timer, color: Colors.green),
// //                         SizedBox(width: 8),
// //                         Text(
// //                           "Estimated Time: ${boy["time"]} min",
// //                           style: TextStyle(
// //                             color: Colors.green,
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 15,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   SizedBox(height: 16),

// //                   // ✅ Call button
// //                   GestureDetector(
// //                     onTap: () => call(boy["number"]),
// //                     child: Container(
// //                       width: double.infinity,
// //                       padding: EdgeInsets.symmetric(vertical: 14),
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(12),
// //                         gradient: LinearGradient(
// //                           colors: [Colors.green, Colors.lightGreen],
// //                         ),
// //                       ),
// //                       child: Center(
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: [
// //                             Icon(Icons.call, color: Colors.white),
// //                             SizedBox(width: 8),
// //                             Text(
// //                               "Call: ${boy["number"]}",
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 16,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }