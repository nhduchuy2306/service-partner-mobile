import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:service_partner/application/services/auth_service.dart';
import 'package:service_partner/application/services/partner_service.dart';
import 'package:service_partner/domain/dtos/partner_dto.dart';
import 'package:service_partner/domain/models/partner.dart';
import 'package:service_partner/presentation/screens/dash_board_screen.dart';
import 'package:service_partner/presentation/screens/register_sceen.dart';
import 'package:service_partner/presentation/states/google_signin_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    NavigatorState navigatorState = Navigator.of(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Language dropdown
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        value: 'Viet Nam',
                        onChanged: (value) {},
                        items: const [
                          DropdownMenuItem(
                            value: 'Viet Nam',
                            child: Text('Viet Nam'),
                          ),
                          DropdownMenuItem(
                            value: 'English',
                            child: Text('English'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Logo
              Expanded(
                flex: 3,
                child: Image.asset('assets/logo/logo.png', height: 250),
              ),
              // Title
              const Expanded(
                flex: 3,
                child: Text(
                  'Happy Clean',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Button Login Google
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      ),
                    );

                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final GoogleSignInProvider googleSignInProvider =
                        GoogleSignInProvider();

                    GoogleSignInAccount? user =
                        await googleSignInProvider.googleLogin();

                    if (user != null) {
                      prefs.setBool('isLogin', true);

                      PartnerDto partnerDto = PartnerDto(
                        displayName: user.displayName ?? "",
                        email: user.email,
                        phoneNumber: "",
                        photoURL: user.photoUrl!,
                        providerId: "",
                        uid: user.id,
                      );

                      Partner? partner =
                          await PartnerService.getPartnerById(user.id);

                      print("Partner: ${partner?.partnerId}");

                      if (partner == null) {
                        await AuthService.googleAuthForPartner(partnerDto);

                        navigatorState.pushAndRemoveUntil(
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: RegisterScreen(partnerDto: partnerDto),
                            ),
                            (route) => false);
                      } else {
                        navigatorState.pushAndRemoveUntil(
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: const DashBoardScreen(),
                            ),
                            (route) => false);
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                  ),
                  child: const Text(
                    'Login with Google',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(height: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
