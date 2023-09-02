import 'package:flutter/material.dart';
import 'package:service_partner/presentation/screens/register_sceen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                  ),
                  child: const Text('Login with Google'),
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
