import 'package:budgetbuddy/features/analytics/widgets/activity_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,
  );

  List<Color> gradientColors = [
    AppColors.blue,
    Colors.cyan,
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.grey,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 5:
        text = const Text('Wed', style: style);
        break;
      case 7:
        text = const Text('Thu', style: style);
        break;
      case 9:
        text = const Text('Fri', style: style);
        break;
      case 11:
        text = const Text('Sat', style: style);
        break;
      case 13:
        text = const Text('Sun', style: style);
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
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              height: screenHeight * 0.155,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: screenHeight * 0.09,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Report & Analytics",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Lorem Ipsum Text",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBar(
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      unselectedLabelColor: Colors.black38,
                      labelColor: AppColors.blue,
                      labelStyle: const TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: const [
                        Tab(
                          text: "ALL TIME",
                        ),
                        Tab(
                          text: "THIS WEEK",
                        ),
                        Tab(
                          text: "TODAY",
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.31,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        controller: _tabController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "\$52,070.00",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_upward_rounded,
                                          size: 30,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Total Earnings",
                                      style: TextStyle(
                                        // fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: LineChart(
                                  LineChartData(
                                    gridData: FlGridData(
                                      show: false,
                                      drawVerticalLine: true,
                                      horizontalInterval: 1,
                                      verticalInterval: 2,
                                      getDrawingHorizontalLine: (value) {
                                        return const FlLine(
                                          color: AppColors.blue,
                                          strokeWidth: 1,
                                        );
                                      },
                                      getDrawingVerticalLine: (value) {
                                        return const FlLine(
                                          color: AppColors.blue,
                                          strokeWidth: 1,
                                        );
                                      },
                                    ),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      rightTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
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
                                          showTitles: false,
                                          interval: 1,
                                          getTitlesWidget: leftTitleWidgets,
                                          reservedSize: 42,
                                        ),
                                      ),
                                    ),
                                    borderData: FlBorderData(
                                      show: false,
                                      border: Border.all(
                                          color: const Color(0xff37434d)),
                                    ),
                                    minX: 0,
                                    maxX: 14,
                                    minY: 0,
                                    maxY: 6,
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: const [
                                          FlSpot(0, 3.1),
                                          FlSpot(1, 3),
                                          FlSpot(2.6, 2),
                                          FlSpot(4.9, 5),
                                          FlSpot(6.8, 3.1),
                                          FlSpot(8, 4),
                                          FlSpot(9.5, 3),
                                          FlSpot(11, 4),
                                          FlSpot(13, 2),
                                          FlSpot(14, 5),
                                        ],
                                        isCurved: true,
                                        color: Colors.redAccent,
                                        barWidth: 3,
                                        isStrokeCapRound: true,
                                        dotData: const FlDotData(
                                          show: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: screenWidth,
                          ),
                          Container(
                            width: screenWidth,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 40, 0, 20),
                  child: Text(
                    "-- ACTIVITY --",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // margin: const EdgeInsets.symmetric(vertical: ),
              height: 200,
              width: screenWidth,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const ActivityCardWidget();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
