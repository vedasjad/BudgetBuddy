import 'package:budgetbuddy/features/home/screens/home_screen.dart';
import 'package:budgetbuddy/features/notifications/screens/notifications_screen.dart';
import 'package:budgetbuddy/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../analytics/screens/analytics_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> screens = [
    HomeScreen(),
    AnalyticsScreen(),
    NotificationsScreen(),
    SettingsScreen()
  ];
  int selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0,
        leading: IconButton.outlined(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            side: MaterialStatePropertyAll(
              BorderSide(
                color: Colors.white.withOpacity(
                  0.5,
                ),
              ),
            ),
          ),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipOval(
                  child: Image.network(
                    "https://tse4.mm.bing.net/th?id=OIP.itf5AVUXcelxNB3vRSb-QQAAAA&pid=Api&P=0&h=180",
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        constraints: const BoxConstraints.expand(),
                        color: Colors.white,
                      );
                    },
                    errorBuilder: (context, child, loadingProgress) {
                      return Container(
                        constraints: const BoxConstraints.expand(),
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: screens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedScreenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: selectedScreenIndex == 0
                  ? AppColors.blue
                  : AppColors.blue.withOpacity(0.5),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics,
              color: selectedScreenIndex == 1
                  ? AppColors.blue
                  : AppColors.blue.withOpacity(0.5),
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: selectedScreenIndex == 2
                  ? AppColors.blue
                  : AppColors.blue.withOpacity(0.5),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: selectedScreenIndex == 3
                  ? AppColors.blue
                  : AppColors.blue.withOpacity(0.5),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
