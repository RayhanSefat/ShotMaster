import 'package:flutter/material.dart';
import 'package:radial_progress/radial_progress.dart';
import 'package:stancebeam/screens/homes/sessionscreen/insigtscreen.dart';
import 'package:stancebeam/screens/homes/sessionscreen/sessionscreen.dart';

class SessionSummaryScreen extends StatefulWidget {
  const SessionSummaryScreen({super.key});

  @override
  State<SessionSummaryScreen> createState() => _SessionSummaryScreenState();
}

class _SessionSummaryScreenState extends State<SessionSummaryScreen> {
  Map<String, double> dataMap = {
    "a": 5,
    "b": 3,
  };
  final colorList = <Color>[const Color(0xfffdcb6e), Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Summary'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 18),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Total Swing'),
                                        Spacer(),
                                        Text('10'),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text('Played'),
                                        Spacer(),
                                        Text('10'),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 3,
                                      color: Color(0xff48AECE),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text('Missed'),
                                        Spacer(),
                                        Text('0'),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 3,
                                      color: Color(0xff48AECE),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: Image.asset('assets/field.png'),
                            // ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                color: Colors.black,
                                child: Text(
                                  'Session Summary',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  RadialProgressWidget(
                                    percent: 0.23,
                                    diameter: 50,
                                    progressLineWidth: 10,
                                    startAngle: StartAngle.top,
                                    enableAnimation: true,
                                    animationDuration:
                                        const Duration(seconds: 2),
                                    progressLineColors: const [
                                      Colors.lightBlueAccent,
                                      Colors.lightBlue,
                                      Colors.blue,
                                    ],
                                    centerChild: const Text(
                                      '23 %',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Max Bat Speed(Km/h)',
                                    style: TextStyle(
                                      fontSize: 9,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  RadialProgressWidget(
                                    percent: 0.23,
                                    diameter: 50,
                                    progressLineWidth: 10,
                                    startAngle: StartAngle.top,
                                    enableAnimation: true,
                                    animationDuration:
                                        const Duration(seconds: 2),
                                    progressLineColors: const [
                                      Colors.lightBlueAccent,
                                      Colors.lightBlue,
                                      Colors.blue,
                                    ],
                                    centerChild: const Text(
                                      '23 %',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Max Impact Speed(Km/h)',
                                    style: TextStyle(
                                      fontSize: 9,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  RadialProgressWidget(
                                    percent: 0.23,
                                    diameter: 50,
                                    progressLineWidth: 10,
                                    startAngle: StartAngle.top,
                                    enableAnimation: true,
                                    animationDuration:
                                        const Duration(seconds: 2),
                                    progressLineColors: const [
                                      Colors.lightBlueAccent,
                                      Colors.lightBlue,
                                      Colors.blue,
                                    ],
                                    centerChild: const Text(
                                      '23 %',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Max Power',
                                    style: TextStyle(
                                      fontSize: 9,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SwingsScreen()));
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.account_tree_sharp),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('10'),
                                          Text('Played'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Swings',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.end,
                                    'Check Each Swing Data\n',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => InsightScreen()));
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.account_tree_sharp),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('10'),
                                          Text('Played'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Insights',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.end,
                                    'Awareness and Consistency',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.account_tree_sharp),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('10'),
                                        Text('Played'),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Compare',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.end,
                                  'Compare your sessions with other insights',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/notes.png',
                      ),
                      title: Text(
                        'Notes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Tap to add personalized personalized notes for each session',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
