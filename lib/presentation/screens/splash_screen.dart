import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:service_partner/presentation/screens/dash_board_screen.dart';
import 'package:service_partner/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectInApp();
  }

  void redirectInApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;

    if (!isLogin) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 500),
              child: const LoginScreen(),
            ),
          );
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 500),
              child: const DashBoardScreen(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo.png', height: 250),
            const SizedBox(height: 20),
            const Text(
              'Happy Clean',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
