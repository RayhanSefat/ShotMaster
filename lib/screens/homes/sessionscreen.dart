import 'package:flutter/material.dart';
import 'package:stancebeam/screens/homes/sessionscreen/sessionsummaryscreen.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xffE75B42),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              onTap: (v) {
                setState(() {
                  index = v;
                });
              },
              tabs: [
                Tab(
                  text: 'Session',
                ),
                Tab(
                  text: 'Highlights',
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Explore Session'),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SessionSummaryScreen()));
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
                                'Smart Tamim Iqbal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    '26 Feb 2020  ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '01: 31 PM',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Text(
                                  'Batting',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffE75B42),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/cloud.png',
                                  width: 30,
                                ),
                                SizedBox(width: 10),
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
          ),
        ),
      ],
    );
  }
}
