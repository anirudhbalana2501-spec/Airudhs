import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
             color: Colors.amber,
        child: Column(
          children: [

            buildField("", "Language", change: true),
            buildField("", "Logout",  ),
        

            const SizedBox(height: 20),

            const SizedBox(height: 30),
          ],
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
               Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );

    
  }
}