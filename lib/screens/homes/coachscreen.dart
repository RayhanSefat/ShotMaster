import 'package:flutter/material.dart';

class CoachScreen extends StatefulWidget {
  const CoachScreen({super.key});

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      children: [
        Text(
          'If you are a player',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset('assets/have.png'),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Invite your coach',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'So that your Coach can Access your ShotMaster Swing data, Videos anytime, anywhere and assign you Text, Audio, and Video Feedback and Drills within the app. Click here to invite.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25)),
                            child: Container(
                                padding: EdgeInsets.all(7),
                                color: Color(0xffE75B42),
                                child: Icon(Icons.arrow_forward)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
