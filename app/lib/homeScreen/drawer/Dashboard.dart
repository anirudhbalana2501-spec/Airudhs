//import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:app/homeScreen/drawer/Newres.dart';
import 'package:app/homeScreen/drawer/Sinhglshop.dart';
import 'package:app/homeScreen/drawer/profilepage.dart';
import 'package:app/homeScreen/drawer/newrestro.dart';
import 'package:app/homeScreen/drawer/search.dart';
import 'package:app/homeScreen/drawer/shopmannu.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  List<String> shopname = ["Taco Bell", "LAXMI BAKEY", "Shiv sagar cafe", "frredy food cafe", "Kishana Restaurant",];
  List<String> shoploc = [
    "Shop No 04, Food Court, 3rd Floor",
    "Ram Gali Number 6, opp. Dashera Maidan",
    "Near Hanuman Dhaba, Jaipur, 302004, Raja park",
    "2nd Parking of fort",
    "SBI Bank shive road old city"
  ];
  List<String> shopimage = [
    "assets/images/shopImage/shop1.jpg",
    "assets/images/shopImage/shop2.jpg",
    "assets/images/shopImage/shop3.jpg",
    "assets/images/download.jpg",
    "assets/images/download (1).jpg",
     
  ];
  List<Map<String, dynamic>> shop = [
    {
      "shops": [
        {
          "id": 1,
          "shopname": "Taco Bell",
          "shopimage": "assets/images/shopImage/shop1.jpg",
          "shoploc": "Shop No 04, Food Court, 3rd Floor",
          "rading": "3.4",
          "distance": "10Km",
          "time": "07:00-22:00",
          "days": "Monday to sumday",
          "phone": "9829139264",
          "about": "Pure Vegetarian, Desserts, Chinese, Fast Food, Shakes, Tea",
          "service": ["Wi-fi", "PARKING", "BAR"],
          "review": [
            {"username": "user1", "review": "best shop.."},
            {"username": "user2", "review": "best nice shop.."},
            {"username": "user3", "review": "nice shop.."},
          ],
          "gallery": [
            "assets/images/shopImage/shop1.jpg",
            "assets/images/shopImage/shop1.jpg",
            "assets/images/shopImage/shop1.jpg",
          ],
          "food": [
            {
              "id": 1,
              "name": "SandWich",
              "rate": 100,
              "image": "assets/images/menuitem/sandwich.jpg",
            },
            {
              "id": 2,
              "name": "ChowMein",
              "rate": 120,
              "image": "assets/images/menuitem/ChowMein.jpg",
            },
            {
              "id": 3,
              "name": "HotDog",
              "rate": 220,
              "image": "assets/images/menuitem/hotdog.jpg",
            },
            {
              "id": 4,
              "name": "Burger",
              "rate": 250,
              "image": "assets/images/menuitem/burger.jpg",
            },
          ],
          "addtocart": [],
          "order": [],
        },
        {
          "id": 2,
          "shopname": "LAXMI BAKEY",
          "shopimage": "assets/images/shopImage/shop1.jpg",
          "shoploc": "Shop No 04, Food Court, 3rd Floor",
          "rating": "4.5",
          "distance": "2.5 Km",
          "time": "07:00-22:00",
          "days": "Monday to Sunday",
          "phone": "9999122111",
          "about": "Pure Vegetarian, Desserts, Chinese, Fast Food, Shakes, Tea",
          "service": ["WI-FI", "PARKING", "BAR"],
          "review": [
            {"username": "user1", "review": "best shop.."},
            {"username": "user2", "review": "best nice shop.."},
          ],
          "gallery": [
            "assets/images/shopImage/shop1.jpg",
            "assets/images/shopImage/shop1.jpg",
            "assets/images/shopImage/shop1.jpg",
          ],
          "food": [
            {
              "id": 1,
              "name": "SandWich",
              "rate": 100,
              "image": "assets/images/menuitem/sandwich.jpg",
            },
            {
              "id": 2,
              "name": "ChowMein",
              "rate": 120,
              "image": "assets/images/menuitem/ChowMein.jpg",
            },
            {
              "id": 3,
              "name": "HotDog",
              "rate": 220,
              "image": "assets/images/menuitem/hotdog.jpg",
            },
            // {
            //   "id": 4,
            //   "name": "Burger",
            //   "rate": 250,
            //   "image": "assets/images/menuitem/burger.jpg",
            // },
          ],
          "addtocart": [],
          "order": [],
        },
      ],
    },
  ];

  List<Map<String, dynamic>> menuitem = [
    {
      "product": [
        {
          "id": 1,
          "name": "SandWich",
          "rate": 100,
          "image": "assets/images/menuitem/sandwich.jpg",
          "qty": 1,
        },
        {
          "id": 2,
          "name": "ChowMein",
          "rate": 120,
          "image": "assets/images/menuitem/ChowMein.jpg",
          "qty": 1,
        },
        {
          "id": 3,
          "name": "HotDog",
          "rate": 220,
          "image": "assets/images/menuitem/hotdog.jpg",
          "qty": 1,
        },
        // {
        //   "id": 4,
        //   "name": "Burger",
        //   "rate": 250,
        //   "image": "assets/images/menuitem/burger.jpg",
        //   "qty": 1,
        // },
      ],
      "addtocart": [],
      "order": [],
    },
  ];

  List<String> allfood = [
    "Kachori",
    "North India",
    "Sweets",
    "Pyaaj Kachori",
    "Poha",
    //"South Indian",
  ];
  List<String> allimage = [
    "assets/images/allitems/kachori.png",
    "assets/images/allitems/north indian.png",
    "assets/images/allitems/sweet.png",
    "assets/images/allitems/pyaaj kachori.jpg",
    "assets/images/allitems/poha.jpg",
    //"assets/images/allitems/south-indian.png",
  ];

  // List<String> allfoodd = [
  //   "Kachor",
  //   "North India",
  //   "Sweets",
  //   "Pyaaj Kachori",
  //   "Poha",
  //   "South Indian",
  // ];
  // List<String> allimagee = [
  //   "assets/images/allitems/kachori.png",
  //   "assets/images/allitems/north indian.png",
  //   "assets/images/allitems/sweet.png",
  //   "assets/images/allitems/pyaaj kachori.jpg",
  //   "assets/images/allitems/poha.jpg",
  //   "assets/images/allitems/south-indian.png",
  // ];

  // List<Map<String, dynamic>> allmenuitem = [
  //   {
  //     "name": "North India",
  //     "state": "Punjab, Delhi, UP...",
  //     ""
  //             "image":
  //         "assets/images/west india (1).jpg",
  //   },
  //   {
  //     "name": "South India",
  //     "state": "Tamil Nadu, Kerala, Karna..",
  //     "image": "assets/images/east india.jpg",
  //   },
  //   {
  //     "name": "West India",
  //     "state": "Gujarat, Maharashtra, Raj..",
  //     "image": "assets/images/street.jpg",
  //   },
  //   {
  //     "name": "East India",
  //     "state": "West Bengal, Odisha,",
  //     "image": "assets/images/north india.webp",
  //   },
  //   {
  //     "name": "Central India",
  //     "state": ": MP, Chhattisgarh",
  //     "image": "assets/images/south india.jpg",
  //   },
  //   {
  //     "name": "Street Food",
  //     "state": "Gujarat, Maharashtra, Raj..",
  //     "image": "assets/images/central.webp",
  //   },
  //   {
  //     "name": "International",
  //     "state": "Chinese, Italian, Mexican",
  //     "image": "assets/images/west india (1).jpg",
  //   },
  // ];

  // ignore: non_constant_identifier_names
  SingleSho11(
    String pname,
    String image,
    String loc,
    List<Map<String, dynamic>> menuitem,
  ) {
    print("Single shop");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleShopScreen(
          pname: pname,
          image: image,
          location: loc,
          menuitem: menuitem,
          // shop: ,
        ),
      ),
    );
  }

  allitess(String iimage, String name, String pname, String location) {
    print("object");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Shopmannu(
          image: iimage,
          pname: pname,
          location: location,
          name: name,
        ),
      ),
    );
  }

  allmenuite() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => allmenuite()));
  }

  void ser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Searchitem()),
    );
  }
  void prd() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  // allshop() { //--
  //   Navigator.of(context).push(
  //     //--
  //     MaterialPageRoute(
  //       builder: (context) => allshop(shops: shop),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ChatGPT Image.png'),
                    colorFilter: const ColorFilter.mode(
                      Colors.black26,
                      BlendMode.darken,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          margin: EdgeInsets.only(top: 8, right: 0),
                          child: TextButton(
                            onPressed: () => {
                              Scaffold.of(context).openDrawer(),
                            }, //---
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 280),
                                  child: Icon(
                                    Icons.menu,
                                    size: 29,
                                    color: Colors.black,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 12,
                                        color: Colors.white,
                                        offset: Offset(2, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 230),
                        GestureDetector(
                          onTap: prd,
                          child: Row(
                            children: [
                              CircleAvatar(
                                // foregroundColor: Colors.amber,
                                radius: 20,
                                backgroundColor: Colors.blue.shade100,
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: ser,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 40,
                              width: 336,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  // onTap: () => allmenuitem,
                                  child: Row(
                                    children: [
                                      //SizedBox(width: 120),
                                      Text(
                                        "Search",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 200),

                                      Icon(
                                        Icons.search,
                                        size: 29,
                                        color: Colors.white,
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

                    SizedBox(height: 0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, size: 30, color: Colors.red),
                          Text(
                            "Royal Plaza\nAmrpali....",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                            color: Colors.red,
                          ),
                          SizedBox(width: 140),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Icon(
                              Icons.power_settings_new,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              //Container(),
              SizedBox(height: 15),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Your Food ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 140),
                          Text(
                            "All View",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int a = 0; a < allfood.length; a++)
                              Allitem(
                                iimage: allimage[a],
                                name: allfood[a],
                                // pname: shopname[a],
                                //location: shoploc[a],
                                res: () {
                                  allitess(
                                    allimage[a],
                                    allfood[a],
                                    shopname[a],
                                    shoploc[a],
                                  );
                                },
                              ),
                          ],
                        ),
                      ),

                      // SizedBox(
                      //   height: 120,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: allfood.length,
                      //     itemBuilder: (context, a) {
                      //       return Allitem(
                      //         iimage: allimage[a],
                      //         name: allfood[a],
                      //         res: () {
                      //           allitess(allimage[a], allfood[a]);
                      //         },
                      //       );
                      //     },
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "All mannu",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),

                      // SizedBox(
                      //   height: 120,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: allfoodd.length,
                      //     itemBuilder: (context, b){
                      //       return
                      //       Allitem(
                      //        iimage: allimagee[b],
                      //        name: allfoodd[b],
                      //        all: () {
                      //         allitesss(allfoodd[b], allimagee[b]);
                      //        } ,
                      //       );
                      //     }

                      //   ),
                      // ),
                      SizedBox(height: 0),
                      Column(
                        children: [
                          for (int i = 0; i < shopname.length; i++)
                            ShopComponent(
                              image: shopimage[i],
                              pname: shopname[i],
                              location: shoploc[i],
                            
                              btn: () {
                                SingleSho11(
                                  shopname[i],
                                  shopimage[i],
                                  shoploc[i],
                                  //shop,
                                  menuitem,
                                );
                              },
                            ),
                        ],
                      ),
                    ],
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
