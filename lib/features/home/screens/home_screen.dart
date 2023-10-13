import 'package:budgetbuddy/features/home/widgets/expenses_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../utils/colors.dart';
import '../widgets/scroll_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PanelController panelController = PanelController();

  bool isPanelOpen = false;

  List<Map<String, dynamic>> transactionCards = [
    {
      "title": "Expenses",
      "amount": "1300",
      "color": Colors.red,
    },
    {
      "title": "Income",
      "amount": "20000",
      "color": AppColors.blue,
    },
    {
      "title": "Transfer",
      "amount": "10000",
      "color": Colors.cyan,
    },
    {
      "title": "Loan",
      "amount": "1300",
      "color": Colors.deepOrange,
    }
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SlidingUpPanel(
      controller: panelController,
      onPanelOpened: () {
        setState(() {
          isPanelOpen = true;
        });
      },
      onPanelClosed: () {
        setState(() {
          isPanelOpen = false;
        });
      },
      defaultPanelState: PanelState.CLOSED,
      minHeight: screenHeight * 0.68,
      maxHeight: screenHeight * 0.85,
      color: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        height: screenHeight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text(
                  "Welcome back,",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Row(
              children: [
                Text(
                  "JASON SMITH",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
              ],
            ),
            const Row(
              children: [
                Spacer(),
                Text(
                  "Your balance",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Spacer(),
                Text(
                  "\$24,000.89",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      panel: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            physics: (!isPanelOpen)
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  height: 105,
                  width: screenWidth,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: transactionCards.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TransactionCardWidget(
                        title: transactionCards[index]["title"],
                        amount: transactionCards[index]["amount"],
                        color: transactionCards[index]["color"],
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: Text(
                    "-- THIS MONTH --",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return const ExpensesWidget();
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: Text(
                    "-- LAST MONTH --",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return const ExpensesWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
          (!isPanelOpen)
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onLongPressDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onTapDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onDoubleTapDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onHorizontalDragDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onPanDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onSecondaryTapDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onTertiaryLongPressDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onSecondaryLongPressDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onVerticalDragDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    onTertiaryTapDown: (_) {
                      setState(() {
                        panelController.close();
                      });
                    },
                    child: SizedBox(
                      width: screenWidth,
                      child: const Icon(
                        Icons.expand_circle_down,
                        color: AppColors.blue,
                        size: 35,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
