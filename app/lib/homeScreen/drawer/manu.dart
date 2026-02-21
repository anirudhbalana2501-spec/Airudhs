// //import 'package:app7/src/Model/ProductModel.dart';
// //import 'package:app7/src/screen/SingleMenuScreen.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';

// // ignore: must_be_immutable
// class MenuScreen extends StatefulWidget {    
//   List<Map<String, dynamic>> menuitem;    // super.key
//   MenuScreen({super.key, required this.menuitem, });

//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
// //  ProductModel? datafrommap;  //----
//   var pro = null;  
//   @override
//   Widget build(BuildContext context) {
//     var menuitem = widget.menuitem;
//     print("************menuscreen************");
//     print(menuitem);
//     // print(menuitem[0]["addtocart"]);
//     var addcart = menuitem[0]["addtocart"];
//     try {
//       pro = menuitem[0]['product'];
//       /* for (int i = 0; i < pro.length; i++) {
//         print(pro[i]['name']);
//       } */
//       /* datafrommap =
//           ProductModel.fromJson(json.decode("${menuitem[0]['product']}")); */
//     } catch (e) {
//       print("*******************Exception:-***********************");
//       print(e);
//     }
//     // addtocart(var item1) {
//     //   Navigator.of(context).push(
//     //     MaterialPageRoute(
//     //       builder: (context) => SingleMenuScreen(item: item1, cart: addcart,),
//     //     ),
//     //   );
//     // }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Menu Details"),
//       ),
//       body: ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return Card(
//             color: Colors.amber,
//             child: Container(
//               margin: EdgeInsets.only(top: 20),
//               height: 300,
//               child: Column(children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           "S",
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                         child: CircleAvatar(
//                           maxRadius: 70,
//                           backgroundImage: AssetImage('${pro[index]['image']}'),   //--
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(right: 10, top: 10),
//                         child: Icon(
//                           Icons.favorite_border,
//                           size: 30,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: 20, bottom: 20),
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           "${pro[index]['name']}",
//                           style: const TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 50,
//                           decoration:
//                               BoxDecoration(border: Border.all(width: 1)),
//                           child: Row(children: [
//                             Container(
//                               child: Icon(Icons.star),
//                             ),
//                             Container(
//                               child: Text("3.6"),
//                             )
//                           ]),
//                         ),
//                         Container(
//                           child: Text(
//                             "Rs.${pro[index]['rate']}/-",//---
//                             style: TextStyle(
//                                 fontSize: 30, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(right: 3, bottom: 3),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               // Container(
//                               //   clipBehavior: Clip.antiAlias,
//                               //   decoration: BoxDecoration(
//                               //       color: Color.fromARGB(255, 23, 255, 7),
//                               //       borderRadius: BorderRadius.only(
//                               //           topLeft: Radius.circular(15),
//                               //           bottomRight: Radius.circular(15))),
//                               //   width: 50,
//                               //   child: ElevatedButton(
//                               //     style: ButtonStyle(
//                               //         backgroundColor: MaterialStatePropertyAll(  //---
//                               //             Color.fromARGB(255, 77, 255, 7))),
//                               //     onPressed: () => addtocart(pro[index]),
//                               //     child: Text(
//                               //       "+",
//                               //       style: TextStyle(
//                               //         fontSize: 40,
//                               //       ),
//                               //     ),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ]),
//                 ),
//               ]),
//             ),
//           );
//         },
//         itemCount: pro.length,//--
//       ),
//     );
//   }
// }
