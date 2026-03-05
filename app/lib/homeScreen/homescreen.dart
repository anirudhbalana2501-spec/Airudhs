import 'package:app/homeScreen/drawer/Hader.dart';
import 'package:app/homeScreen/drawer/Dashboard.dart';
import 'package:app/homeScreen/drawer/logout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  final String name;
  final String password;
  const Homescreen({super.key, required this.name, required this.password});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

enum DrawerSection { Dashboard, Logout }

class _HomescreenState extends State<Homescreen> {
  var currentpage = DrawerSection.Dashboard;

  Widget ListData() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          menuItem(
            1,
            "Dashbord",
            Icons.people_alt_outlined,
            currentpage == DrawerSection.Dashboard ? true : false,
          ),
          menuItem(
            2,
            "Logout",
            Icons.logout_outlined,
            currentpage == DrawerSection.Logout ? true : false,
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        //  color: selected ? Colors.amber : Colors.transparent,
        child: InkWell(
          onTap: () async {
            Navigator.pop(context);

            if (id == 1) {
              setState(() {
                currentpage = DrawerSection.Dashboard;
              });
            } else if (id == 2) {
              bool? confirm = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Yes"),
                      ),
                    ],
                  );
                },
              );

              if (confirm == true) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool("isLoggedIn", false);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/login",
                  (route) => false,
                );
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(child: Icon(icon, size: 20, color: Colors.black)),
                SizedBox(width: 20),
                Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Icon(Icons.arrow_right, size: 30, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentpage == DrawerSection.Dashboard) {
      container = Dashboard();
    } else if (currentpage == DrawerSection.Logout) {
      container = Logout();
    }

    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: HeaderComponent(),
                ),
                ListData(),
              ],
            ),
          ),
        ),
        body: container,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          selectedFontSize: 10,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.video_library), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "",
            ),
          ],
        ),

        // bottomNavigationBar: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", ),
        //    BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
        //   BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        //  // BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        // ]),
      ),
    );
  }
}
