import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Payment Method")),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text("CARDS", style: TextStyle(fontSize: 15)),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(0),
              height: 70,
              width: 340,
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
                    SizedBox(width: 20),
                    Text(
                      "Add credit or debit cards",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 55),
                    //Text("Light"),
                    //SizedBox(width: 25),
                    Icon(Icons.add, color: Colors.green, size: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              padding: EdgeInsets.all(0),
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icons8-add-card-100.png',
                      scale: 3,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Add card",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 124),
                    // Text("Light"),
                    SizedBox(width: 40),
                    Icon(Icons.add, color: Colors.green, size: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text("UPI", style: TextStyle(fontSize: 15)),
            ),

            Container(
              padding: EdgeInsets.all(0),
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue.shade100,
                      child: Image.asset(
                        'assets/images/icons8-paytm-100.png',
                        scale: 3,
                      ),
                     
                    ),

                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue.shade100,
                      child: Image.asset(
                        'assets/images/icons8-google-pay-100.png',
                        scale: 3,
                      ),
                   
                    ),

                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue.shade100,
                      child: Image.asset(
                        'assets/images/icons8-phone-pe-100.png',
                        scale: 3,
                      ),

                    ),

                    // Text(
                    //   "Appearance",
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // SizedBox(width: 95),
                    // Text("Light"),
                    // SizedBox(width: 5),
                    // Icon(Icons.arrow_right, size: 27),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,),
            Container(
              padding: EdgeInsets.all(0),
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icons8-bhim-upi-100.png',
                      scale: 3,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "ADD NEW UPI",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 127),
                    //Text("Light"),
                    SizedBox(width: 5),
                    Icon(Icons.add, color: Colors.green,  size: 20,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text("NETBANKING", style: TextStyle(fontSize: 15)),
            ),
            Container(
              padding: EdgeInsets.all(0),
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icons8-bank-100 (1).png',
                      scale: 3,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "NATBANKING",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 130),
                    //Text("Light"),
                   // SizedBox(width: 5),
                    Icon(Icons.add, size: 20, color: Colors.green,),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              height: 70,
              width: 340,
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
                    SizedBox(width: 20),
                    Text(
                      "CASE PAYMENT",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 115),
                   // Text("Light"),
                    //SizedBox(width: 5),
                    Icon(Icons.add, size: 20, color: Colors.green,),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
