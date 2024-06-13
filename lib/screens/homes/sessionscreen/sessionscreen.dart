import 'package:flutter/material.dart';
import 'package:radial_progress/radial_progress.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SwingsScreen extends StatefulWidget {
  const SwingsScreen({super.key});

  @override
  State<SwingsScreen> createState() => _SwingsScreenState();
}

class _SwingsScreenState extends State<SwingsScreen> {
  Map<String, double> dataMap = {
    "a": 5,
    "b": 3,
  };
  final colorList = <Color>[const Color(0xfffdcb6e), Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.green,
                        tabs: [
                          Tab(
                            text: "All",
                          ),
                          Tab(
                            text: "Played",
                          ),
                          Tab(
                            text: "Missed",
                          ),
                        ],
                        labelColor: Colors.black,
                        indicator: RectangularIndicator(
                          bottomLeftRadius: 100,
                          bottomRightRadius: 100,
                          topLeftRadius: 100,
                          topRightRadius: 100,
                          strokeWidth: 1,
                          paintingStyle: PaintingStyle.stroke,
                        ),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (_, i) {
                            return Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        'Swing $i',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
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
                                          'Bat Speed',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
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
                                          'Power',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
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
                                          'Efficiency',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
