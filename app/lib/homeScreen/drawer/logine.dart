import 'package:app/homeScreen/drawer/loginhome.dart';
import 'package:app/homeScreen/homescreen.dart';
import 'package:flutter/material.dart';

class Logine extends StatefulWidget {
  const Logine({super.key});

  @override
  State<Logine> createState() => _LogineState();
}

class _LogineState extends State<Logine> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool ispasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 170),
              const Text(
                "Login",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.deepOrange,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: ispasswordHidden,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  //prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispasswordHidden = !ispasswordHidden;
                      });
                    },
                    icon: Icon(
                      ispasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  print(nameController.text);

                  String name = nameController.text.trim();
                  String password = passwordController.text.trim();

                  String correctUsername = "anirudh";
                  String correctpassword = "123456";

                  if (name.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter name and password")),
                    );
                  } else if (name == correctUsername &&
                      password == correctpassword) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Homescreen(name: "anirudh", password: "123456"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Username or password is incorrect"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text("Login"),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    [
                          'assets/images/icons8-google-100 (1).png',
                          'assets/images/icons8-email-100.png',
                        ]
                        .map(
                          (Ima) => Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  Ima,
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sin UP",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Create an account to explore delicious meals near you",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
