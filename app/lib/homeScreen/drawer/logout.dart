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
          //buildField("", "Language", change: true),
          buildField(
            "",
            "Logout",
            onTap: () async {
              bool? confirm = await showDialog(
                context: Navigator.of(context, rootNavigator: true).context,

                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
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
            },
          ),

          const SizedBox(height: 20),
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
