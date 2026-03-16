import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location2 extends StatefulWidget {
  const Location2({super.key});

  @override
  State<Location2> createState() => _Location2State();
}

class _Location2State extends State<Location2> {
  // ✅ Har address ke liye alag controller
  Map<String, String> savedAddresses = {"Home": "", "Office": "", "Other": ""};

  String? selectedAddress; // ✅ Jo select kiya hai

  @override
  void initState() {
    super.initState();
    loadAddresses();
  }

  // ✅ Load karo
  Future<void> loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('savedAddresses');
    if (data != null) {
      Map decoded = jsonDecode(data);
      setState(() {
        savedAddresses = Map<String, String>.from(decoded);
        selectedAddress = prefs.getString('selectedAddress');
      });
    }
  }

  // ✅ Save karo
  Future<void> saveAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedAddresses', jsonEncode(savedAddresses));
  }

  // ✅ Current location lo   /// (GPS)
  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('userLat', position.latitude);
    await prefs.setDouble('userLng', position.longitude);
    ////

    // ✅ Dialog dikhao
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Save Karo"),
        content: Text("Current location kahan save karni hai?"),
        actions: [
          TextButton(
            onPressed: () async {
              setState(() => selectedAddress = "Current Location");
              await prefs.setString('selectedAddress', "Current Location");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Current location select ho gayi! ✅"),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text("Sirf Select Karo"),
          ),

          // ✅ Unselect button
          TextButton(
            onPressed: () async {
              setState(() => selectedAddress = null);
              await prefs.remove('selectedAddress');
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Location unselect ho gayi! ❌"),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: Text("Unselect", style: TextStyle(color: Colors.red)),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () async {
              setState(() {
                savedAddresses["Home"] =
                    "${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}";
                selectedAddress = "Home";
              });
              await saveAddresses();
              await prefs.setString('selectedAddress', "Home");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Home mein save ho gaya! ✅"),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text("Home", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {
              setState(() {
                savedAddresses["Office"] =
                    "${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}";
                selectedAddress = "Office";
              });
              await saveAddresses();
              await prefs.setString('selectedAddress', "Office");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Office mein save ho gaya! ✅"),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            child: Text("Office", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () async {
              setState(() {
                savedAddresses["Other"] =
                    "${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}";
                selectedAddress = "Other";
              });
              await saveAddresses();
              await prefs.setString('selectedAddress', "Other");
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Other mein save ho gaya! ✅"),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            child: Text("Other", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    // setState(() {
    //   selectedAddress = "Current Location";
    // });

    // await prefs.setString('selectedAddress', "Current Location");

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text("Current location select ho gayi! ✅"),
    //     backgroundColor: Colors.green,
    //   ),
    // );
  }

  // ✅ Address edit karo
  void editAddress(String label) {
    TextEditingController controller = TextEditingController(
      text: savedAddresses[label],
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("$label Address"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "$label ka address likho...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () async {
              setState(() {
                savedAddresses[label] = controller.text;
              });
              await saveAddresses();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$label address save ho gaya! ✅")),
              );
            },
            child: Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // ✅ Address select karo - order ke liye
  void selectAddress(String label) async {
    if (savedAddresses[label]!.isEmpty) {
      // ✅ Pehle address add karo
      editAddress(label);
      return;
    }

    setState(() {
      selectedAddress = label;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedAddress', label);
    await prefs.setString('selectedAddressText', savedAddresses[label]!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$label select ho gaya! ✅"),
        backgroundColor: Colors.green,
      ),
    );
  }

  // ✅ Label ka icon
  IconData getLabelIcon(String label) {
    switch (label) {
      case "Home":
        return Icons.home;
      case "Office":
        return Icons.work;
      default:
        return Icons.location_on;
    }
  }

  // ✅ Address container widget
  Widget addressContainer(String label) {
    bool isSelected = selectedAddress == label;
    bool hasAddress = savedAddresses[label]!.isNotEmpty;

    return GestureDetector(
      onTap: () => selectAddress(label),
      onLongPress: () async {
        // ✅ yahan add karo
        if (selectedAddress == label) {
          setState(() => selectedAddress = null);
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('selectedAddress');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$label unselect ho gaya! ❌"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Row(
          children: [
            // ✅ Icon
            CircleAvatar(
              backgroundColor: isSelected ? Colors.green : Colors.grey.shade100,
              child: Icon(
                getLabelIcon(label),
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            SizedBox(width: 12),

            // ✅ Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isSelected ? Colors.green : Colors.black,
                    ),
                  ),
                  Text(
                    hasAddress ? savedAddresses[label]! : "Tap karke add karo",
                    style: TextStyle(
                      color: hasAddress ? Colors.grey : Colors.orange,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // ✅ Edit button
            GestureDetector(
              onTap: () => editAddress(label),
              child: Icon(Icons.edit, color: Colors.grey, size: 20),
            ),

            // ✅ Selected tick
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.check_circle, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select a Location",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // ✅ Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    "Search your location",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),

          // ✅ Current location button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: getCurrentLocation,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                  border: Border.all(
                    color: selectedAddress == "Current Location"
                        ? Colors.green
                        : Colors.grey.shade200,
                    width: selectedAddress == "Current Location" ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.my_location, color: Colors.green),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "My Current Location",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (selectedAddress == "Current Location")
                      Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // ✅ Saved locations heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "Saved Locations",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // ✅ Home, Office, Other - alag alag containers
          addressContainer("Home"),
          addressContainer("Office"),
          addressContainer("Other"),
        ],
      ),
    );
  }
}











// import 'package:flutter/material.dart';

// class Location2 extends StatefulWidget {
//   const Location2({super.key});

//   @override
//   State<Location2> createState() => _Location2State();
// }

// class _Location2State extends State<Location2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Select a location",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 40),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               padding: EdgeInsets.only(left: 20),
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.search),
//                   SizedBox(width: 20),
//                   Text(
//                     "Search your location",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(height: 9),

//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               padding: EdgeInsets.only(left: 20),
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.location_searching_rounded),
//                   SizedBox(width: 20),
//                   Text(
//                     "My Current Kocation",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 50),
//                   Icon(Icons.arrow_right),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               padding: EdgeInsets.only(left: 20),
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.add),
//                   SizedBox(width: 20),
//                   Text(
//                     "Add Address",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 90),
//                   Icon(Icons.arrow_right),
//                 ],
//               ),
//             ),
//           ),
          
//           Text("Saved Addresses"),



//         ],
//       ),
//     );
//   }
// }
