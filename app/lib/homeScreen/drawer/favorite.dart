//import 'dart:async';
//import 'package:app/components/shop_component.dart';
//import 'package:app/data/favorites_data.dart';
import 'package:app/homeScreen/drawer/Sinhglshop.dart';
import 'package:app/homeScreen/drawer/saver.dart';
import 'package:app/homeScreen/drawer/shopcomponet.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    // ✅ Screen open hone par load karo
    loadFavorites().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Favorites",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.favorite),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: favoriteShops.isEmpty
          // ✅ Koi favorite nahi hai
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "Koi favorite nahi hai!",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          // ✅ Favorites list show karo
          : ListView.builder(
              itemCount: favoriteShops.length,
              itemBuilder: (context, index) {
                return ShopComponent(
                  image: favoriteShops[index]['image'],
                  pname: favoriteShops[index]['pname'],
                  location: favoriteShops[index]['location'],
                  numm: favoriteShops[index]['numm'],
                  btn: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleShopScreen(
                          image: favoriteShops[index]['image'],
                          pname: favoriteShops[index]['pname'],
                          location: favoriteShops[index]['location'],
                          numm: favoriteShops[index]['numm'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
