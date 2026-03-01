import 'package:app/homeScreen/drawer/Dashboard.dart';
import 'package:app/homeScreen/drawer/shopcomponet.dart';
import 'package:app/homeScreen/drawer/newrestro.dart';
import 'package:flutter/material.dart';

class Searchitem extends StatefulWidget {
  //String? nname;
  //String? aimage;
  //dynamic Function()? sear;
  const Searchitem({super.key});

  @override
  State<Searchitem> createState() => _SearchitemState();
}

class _SearchitemState extends State<Searchitem> {

  void homm (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
  }


 List<Map<String, dynamic>> allmenuitem = [
    {"name": "North India",    "image":"assets/images/west india (1).jpg",},
    {"name": "South India","image": "assets/images/east india.jpg",},
    {"name": "West India","image": "assets/images/central.webp",},
    {"name": "East India","image": "assets/images/north india.webp",},
    {"name": "Central India","image": "assets/images/south india.jpg",},
    {"name": "Street Food","image": "assets/images/street.jpg"},
    {"name": "International","image": "assets/images/west india (1).jpg",},
  ];

  List<Map<String, dynamic>> allfood = [
    {"name": "North India", "iimage": "assets/images/allitems/kachori.png"},
    {"name": "South India", "iimage": "assets/images/allitems/north indian.png"},
    {"name": "West India", "iimage": "assets/images/allitems/sweet.png"},
    {"name": ". East India","iimage": "assets/images/allitems/pyaaj kachori.jpg",},
    {"name": "Central India", "iimage": "assets/images/allitems/poha.jpg"},
    {"name": "Street Food","iimage": "assets/images/allitems/south-indian.png"},
    {"name": "Street Food","iimage": "assets/images/street.jpg"},
    {"name": "International","iimage": "assets/images/west india (1).jpg",},
     {"name": "South India","iimage": "assets/images/east india.jpg",},
    {"name": "West India","iimage": "assets/images/central.webp",},
  ];

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child:   GestureDetector(onTap: homm, child: Icon(Icons.arrow_back_ios)),
                  //Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Container(
                    padding: EdgeInsets.all(0),
                    height: 40,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 150),
                        Icon(Icons.search, size: 29, color: Colors.black),
                        SizedBox(width: 00),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 25,
                        bottom: 20,
                      ),
                      child: Text(
                        "Your Foood",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: allmenuitem.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  allmenuitem[index]["image"],
                                  height: 80,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                allmenuitem[index]["name"],
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 15,
                        bottom: 20,
                      ),
                      child: Text(
                        "All Mannu",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: allfood.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  allfood[index]["iimage"], 
                                  height: 80,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                allfood[index]["name"],
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                     SizedBox(height: 30),
                    // Column(
                    //     children: [
                    //       for (int i = 0; i < allfood.length && i < allmenuitem.length; i++)
                    //         Newrestro(
                    //           iimage: allfood[i],
                    //           name: allmenuitem[i],
                    //           new: () {
                    //             newshop(
                    //               allfood[i],
                    //               allmenuitem[i],
                                  
                                  
                    //             );
                    //           },
                    //         ),
                    //     ],
                    //   ),

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
