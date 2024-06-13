import 'package:flutter/material.dart';
import 'package:stancebeam/screens/homes/plaayscreens/smartvideoscreen.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SmartVideoScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 25),
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
                          'Smart Video and Stats',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Reach each swing automatically',
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
