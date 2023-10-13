import 'package:budgetbuddy/utils/colors.dart';
import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.85,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      TabBar(
                        indicatorPadding: const EdgeInsets.all(5),
                        indicatorWeight: 2,
                        indicatorColor: Colors.blue,
                        controller: _tabController,
                        unselectedLabelColor: Colors.black38,
                        labelColor: AppColors.blue,
                        labelStyle: const TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: const [
                          Tab(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_upward_rounded,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Expenses",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Income",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.75,
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          controller: _tabController,
                          children: [
                            Container(
                              width: screenWidth,
                              color: Colors.red,
                            ),
                            Container(
                              width: screenWidth,
                              color: Colors.green,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
