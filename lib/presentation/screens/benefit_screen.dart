import 'package:flutter/material.dart';

class BenefitScreen extends StatefulWidget {
  const BenefitScreen({super.key});

  @override
  State<BenefitScreen> createState() => _BenefitScreenState();
}

class _BenefitScreenState extends State<BenefitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Benefit Screen'),
      ),
    );
  }
}
