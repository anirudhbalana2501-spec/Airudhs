import 'package:flutter/material.dart';

class FadingButtonExample extends StatefulWidget {
  const FadingButtonExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FadingButtonExampleState createState() => _FadingButtonExampleState();
}

class _FadingButtonExampleState extends State<FadingButtonExample> {
  double _opacity = 1.0;

  void _fadeButton() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fading Button")),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          child: ElevatedButton(
            onPressed: _fadeButton,
            
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  height: 50,
                 // width: 100,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                    //    height: 20,
                     //   width: 20,
                        color: Colors.amberAccent,
                        child: Text("adssss"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}