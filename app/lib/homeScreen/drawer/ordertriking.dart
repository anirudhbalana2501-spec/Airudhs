import 'dart:async';
import 'package:app/homeScreen/drawer/cart_data.dart';
import 'package:app/homeScreen/drawer/deliverydetail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderTrackingScreen extends StatefulWidget {
  final OrderHistory order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Timer? _timer;
  int _remainingSeconds = 300;
  bool _isCancelled = false;

  void openUserLocation() async {
    var url = Uri.parse("geo:0,0?q=my+location");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void openDeliveryLocation() async {
    var url = Uri.parse("geo:26.9157,70.9083?q=26.9157,70.9083(Delivery+Boy)");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  void initState() {
    super.initState();
    // ✅ Order place hone ke baad kitna time bacha hai calculate karo
    _isCancelled = widget.order.isCancelled;
    final difference = DateTime.now().difference(widget.order.date);
    _remainingSeconds = 300 - difference.inSeconds;
    if (_remainingSeconds < 0) _remainingSeconds = 0;

    // ✅ Timer start karo
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ✅ Time format karo
  String get timerText {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  // ✅ Cancel order
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
              // ✅ Order cancel karo
              int index = orderHistory.indexOf(widget.order);
              if (index != -1) {
                setState(() {
                  orderHistory[index].isCancelled = true;
                  _isCancelled = true;
                  _remainingSeconds = 0;
                  _timer?.cancel();
                });
                await saveOrderHistory();
              }
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Order cancel ho gaya! ❌")),
              );
              Navigator.pop(context); // tracking screen band
            },
            child: Text("Cancel Order", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Tracking 📦",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Order confirmed banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white, size: 40),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Confirmed! 🎉",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.order.date.day}/${widget.order.date.month}/${widget.order.date.year} - ${widget.order.date.hour}:${widget.order.date.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ✅ Order items
            Text(
              "Order Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  ...widget.order.items.map(
                    (item) => Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.image,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text("${item.quantity} x ₹${item.price}"),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "₹${widget.order.total}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            if (widget.order.isCancelled)
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
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // ✅ Cancel button - 5 minute tak dikhega
            if (_remainingSeconds > 0 && !widget.order.isCancelled)
              // if (_remainingSeconds > 0 && !widget.order.isCancelled)
              Column(
                children: [
                  // ✅ Timer dikhao
                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: Colors.orange.shade50,
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: Colors.orange),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.timer, color: Colors.orange),
                  //       SizedBox(width: 8),
                  //       Text(
                  //         "Cancel kar sakte ho: $timerText",
                  //         style: TextStyle(
                  //           color: Colors.orange,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 10),

                  // ✅ Cancel button
                  GestureDetector(
                    onTap: cancelOrder,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14),
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
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),

            SizedBox(height: 20),

            // ✅ thoda space

            // ✅ User location button
            GestureDetector(
              onTap: openUserLocation,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.lightBlue],
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.my_location, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Meri Location 📍",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10), // ✅ thoda space
            // ✅ Delivery boy location button
            GestureDetector(
              onTap: openDeliveryLocation,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delivery_dining, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Delivery Boy Location 🛵",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ✅ Delivery Detail button - hamesha dikhega
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeliveryDetailScreen(order: widget.order),
                  ),
                );
              },
              // onTap: () {
              //   // ✅ Baad mein delivery page banayenge
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text("Delivery detail coming soon!")),
              //   );
              // },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.lightGreen],
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delivery_dining, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Delivery Detail",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
