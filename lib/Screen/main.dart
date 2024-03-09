import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes_app/Screen/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Memes App",
      home: Memes_App(),
    ),
  );
}

class Memes_App extends StatefulWidget {
  const Memes_App({super.key});

  @override
  State<Memes_App> createState() => _Memes_AppState();
}

class _Memes_AppState extends State<Memes_App> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/Assets/Images/spalesh.png"),
          ],
        ),
      ),
    ));
  }
}
