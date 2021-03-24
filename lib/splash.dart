import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MenuOptionsScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'images/quizapplogo.jpg',
                width: 400,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Quiz begins\nTest Yourself !!",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontFamily: "Satisfy",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 700,
                height: 300,
                child: FlareActor(
                  "assets/teddy_success.flr",
                  animation: "success",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
