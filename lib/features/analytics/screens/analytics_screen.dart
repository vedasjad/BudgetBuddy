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

  bool isPanelOpen = false;
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              height: screenHeight * 0.11,
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
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TabBar(
                      indicatorColor: AppColors.blue,
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
                          Container(
                            width: screenWidth,
                            color: Colors.green,
                          ),
                          Container(
                            width: screenWidth,
                            color: Colors.orange,
                          ),
                          Container(
                            width: screenWidth,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
