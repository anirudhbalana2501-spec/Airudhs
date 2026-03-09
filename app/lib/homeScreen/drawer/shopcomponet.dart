import 'package:app/homeScreen/drawer/colorrating.dart';
import 'package:app/homeScreen/drawer/favorite.dart';
import 'package:app/homeScreen/drawer/saver.dart';
import 'package:flutter/material.dart';
//import 'package:app/components/colorrating.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//import 'package:app/components/shop_component.dart';

// ignore: must_be_immutable
class ShopComponent extends StatefulWidget {
  final String? image;
  final String? pname;
  final String? location;
  final String? numm;
  final dynamic Function()? btn;
  const ShopComponent({
    super.key,
    this.image,
    this.pname,
    this.location,
    this.btn,
    required this.numm,
  });

  @override
  State<ShopComponent> createState() => _ShopComponentState();
}

class _ShopComponentState extends State<ShopComponent> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();

    isFavorite = favoriteShops.any((shop) => shop['pname'] == widget.pname);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.btn,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 290,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.asset(
                    widget.image ?? "assets/default.png",
                    height: 160,
                    //clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 12,
                  left: 12,

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Exective Thaile • ₹450",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          favoriteShops.add({
                            'image': widget.image,
                            'pname': widget.pname,
                            'location': widget.location,
                            'numm': widget.numm,
                          });
                        } else {
                          favoriteShops.removeWhere(
                            (shop) => shop['pname'] == widget.pname,
                          );
                        }
                      });
                      await saveFavorites(); // ✅ Save karo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteScreen(),
                        ),
                      );
                    },

                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.pname}",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colorrating.getRatingColor(widget.numm),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Text(
                              widget.numm ?? "0.0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.star, size: 12, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6),
                  Text(
                    "${widget.location}",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Text(
                    " Near & Fast",
                    style: TextStyle(color: Colors.green, fontSize: 13),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "30% Off ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(left: 10),
            //   width: 100,
            //   height: 130,
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Image.asset("${widget.image}", fit: BoxFit.cover),
            // ),

            // Container(
            //   margin: EdgeInsets.only(left: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(top: 0),
            //         height: 30,
            //         child: Text(
            //           "${widget.pname}",
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ),
            //       Container(
            //         height: 30,
            //         width: 120,
            //         child: Text(
            //           "${widget.location}",
            //           style: TextStyle(fontSize: 12),
            //         ),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           border: Border.all(width: 1),
            //         ),
            //         margin: EdgeInsets.only(top: 10),
            //         padding: EdgeInsets.all(5),
            //         child: Row(
            //           children: [Icon(Icons.star, size: 20), Text("3.7")],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

/*  */
