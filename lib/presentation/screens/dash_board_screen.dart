import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:service_partner/presentation/screens/login_screen.dart';
import 'package:service_partner/presentation/states/google_signin_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            var googleProvider = GoogleSignInProvider();
            await googleProvider.googleSignOut();

            prefs.remove('isLogin');

            Future.delayed(const Duration(seconds: 0), () {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const LoginScreen(),
                  ),
                  (route) => false);
            });
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
