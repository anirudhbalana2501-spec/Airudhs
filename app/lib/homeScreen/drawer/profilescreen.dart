import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Your Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Profile Avatar Section
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                 // bottom: -30,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.blue.shade100,
                        child: const Text(
                          "A",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey.shade300,
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

             SizedBox(height: 30),

            /// Form Fields
            buildField("Name", "anirudh Singh"),
            buildField("Mobile", "9950359373", change: true),
            buildField("Email", "", change: true),
            buildField("Date of birth", "17/09/2002"),
            buildField("Anniversary", ""),
            buildField("Gender", "", dropdown: true),

            const SizedBox(height: 30),

            /// Update Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Update profile",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildField(String label, String value,
      {bool change = false, bool dropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value.isEmpty ? label : value,
                    style: TextStyle(
                      fontSize: 16,
                      color: value.isEmpty ? Colors.grey : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            if (change)
              const Text(
                "CHANGE",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (dropdown)
              const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
