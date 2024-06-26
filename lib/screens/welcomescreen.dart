import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stancebeam/screens/reg/1.tellaboutscreen.dart';
import 'package:stancebeam/screens/registrationscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => RegistrationScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => TellAboutScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE75B42),
      body: Column(
        children: [
          Spacer(),
          Image.asset('assets/shotmaster.png'),
          CircularProgressIndicator(),
          Spacer(),
          Text(
            '#Take your shot',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
