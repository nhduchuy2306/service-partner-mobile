import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_partner/presentation/screens/benefit_screen.dart';
import 'package:service_partner/presentation/screens/home_screen.dart';
import 'package:service_partner/presentation/screens/mail_screen.dart';
import 'package:service_partner/presentation/screens/profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  List<Widget> getScreens() {
    return [
      const HomeScreen(),
      const MailScreen(),
      const BenefitScreen(),
      const ProfileScreen(),
    ];
  }

  List<BottomNavigationBarItem> getNavigatorItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.mail_solid),
        label: 'Hộp thư',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart_circle_fill),
        label: 'Phúc lợi',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Tài khoản',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screens = getScreens();
    final navigatorItems = getNavigatorItems();

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: navigatorItems,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[700],
      ),
    );
  }
}
