import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        children: [
          buildField(
            "",
            "Logout",

            onTap: () async {
              bool? confirm = await showGeneralDialog(
                 context: Navigator.of(context, rootNavigator: true).context,
                //context: context,
                barrierDismissible: true,
                barrierLabel: "Logout",
                transitionDuration: Duration(milliseconds: 300),

                pageBuilder: (context, animation, secondaryAnimation) {
                  return Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.logout, size: 50, color: Colors.red),

                            SizedBox(height: 15),

                            Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 10),

                            Text("Are you sure you want to logout?"),

                            SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: Text("Cancel"),
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Text("Yes"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

                transitionBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                        child: child,
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
               const SizedBox(height: 20);
              }
            },
           
          ),
          //const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildField(
    String label,
    String value, {
    bool change = false,
    bool dropdown = false,
    VoidCallback? onTap, // ✅ ADD THIS
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: InkWell(
        // ✅ CLICKABLE BANAYA
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
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
                child: Text(value, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
