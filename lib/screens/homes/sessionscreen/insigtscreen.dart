import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:radial_progress/radial_progress.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';

import '../../../multi_level_pie/multi_level_pie.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  Map<String, double> dataMap = {
    "a": 5,
    "b": 3,
  };
  final colorList = <Color>[const Color(0xfffdcb6e), Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xffE75B42),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  tabs: [
                    Tab(
                      text: 'Overall',
                    ),
                    Tab(
                      text: 'Vertical Shots',
                    ),
                    Tab(
                      text: 'Horizontal Shots',
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            RadialProgressWidget(
                              percent: 0.23,
                              diameter: 50,
                              progressLineWidth: 10,
                              startAngle: StartAngle.top,
                              enableAnimation: true,
                              animationDuration: const Duration(seconds: 2),
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
                              'Hit(%)',
                              textAlign: TextAlign.center,
                            ),
                            RadialProgressWidget(
                              percent: 0.23,
                              diameter: 50,
                              progressLineWidth: 10,
                              startAngle: StartAngle.top,
                              enableAnimation: true,
                              animationDuration: const Duration(seconds: 2),
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
                              'Avg Efficiency(%)',
                              textAlign: TextAlign.center,
                            ),
                            RadialProgressWidget(
                              percent: 0.23,
                              diameter: 50,
                              progressLineWidth: 10,
                              startAngle: StartAngle.top,
                              enableAnimation: true,
                              animationDuration: const Duration(seconds: 2),
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
                              'Avg Impact Time(sec)',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 200,
                              height: 300,
                              child: Center(
                                child: MultiLevelPieChart(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  labelTextStyle: TextStyle(fontSize: 11),
                                  hidePercentageLabel: true,
                                  chartSize: 150,
                                  chartInfo: [
                                    MultiLevelPieChartInfo(
                                      startAngle: 70,
                                      percentage: 80,
                                      label: 'Defensive',
                                      foregroundColor: Colors.blue,
                                    ),
                                    MultiLevelPieChartInfo(
                                      startAngle: 150,
                                      percentage: 50,
                                      foregroundColor: Colors.green,
                                      label: 'Attacking',
                                    ),
                                    MultiLevelPieChartInfo(
                                      startAngle: 210,
                                      percentage: 60,
                                      foregroundColor: Colors.orange,
                                      label: 'Powerful',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You hit 45% of shots to score runs.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/1.png'),
                          Flexible(
                            child: Text(
                                'You hit the ball every time you swing the bat. Excellent!'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/2.png'),
                          Flexible(
                            child: Text(
                                'Your vertical bat swings were 50% of the total swings. That\'s good if you are playing as per the length of the ball.'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/3.png'),
                          Text('You timed 86% of the shots played.'),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(12),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          'Speed Graph',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SimpleBarChart(
                          makeItDouble: true,
                          listOfHorizontalBarData: [
                            HorizontalDetailsModel(
                              name: '1',
                              color: Colors.purple,
                              size: 35,
                              sizeTwo: 35,
                              colorTwo: Colors.green,
                            ),
                            HorizontalDetailsModel(
                              name: '2',
                              color: Colors.purple,
                              size: 40,
                              sizeTwo: 40,
                              colorTwo: Colors.green,
                            ),
                            HorizontalDetailsModel(
                              name: '3',
                              color: Colors.purple,
                              size: 60,
                              sizeTwo: 55,
                              colorTwo: Colors.green,
                            ),
                            HorizontalDetailsModel(
                              name: '4',
                              color: Colors.purple,
                              size: 40,
                              sizeTwo: 40,
                              colorTwo: Colors.green,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: Colors.purple,
                              size: 35,
                              sizeTwo: 35,
                              colorTwo: Colors.green,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: Colors.purple,
                              size: 60,
                              sizeTwo: 55,
                              colorTwo: Colors.green,
                            ),
                          ],
                          verticalInterval: 20,
                          horizontalBarPadding: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(12),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          'Angle Graph',
                          style: TextStyle(color: Colors.grey),
                        ),
                        LineChartSample2(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('1', style: style);
        break;
      case 5:
        text = const Text('3', style: style);
        break;
      case 8:
        text = const Text('5', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '60';
        break;
      case 3:
        text = '120';
        break;
      case 5:
        text = '210';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.green,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.pink,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
