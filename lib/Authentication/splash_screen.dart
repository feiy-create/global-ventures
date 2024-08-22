//import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:global_luxury_escapes/Authentication/log_in.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer (const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder:(context) =>const log_in()),
      );
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset("assets/images/pic21.jpg")
        );
  }
}