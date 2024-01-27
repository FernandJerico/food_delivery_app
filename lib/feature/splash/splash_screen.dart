import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/themes/theme.dart';
import 'package:food_delivery_app/feature/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const OnboardingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: 0.0, end: 1.0);
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              },
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(children: [
        Positioned(
            top: 0,
            width: sizes.width,
            child: Image.asset('assets/images/bg-splashscreen.png')),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/icon-courier.png'),
            Text(
              'Food Couriers',
              style: GoogleFonts.poppins(
                  fontSize: 45,
                  color: primaryColor,
                  fontWeight: FontWeight.w900),
            )
          ],
        )
      ]),
    );
  }
}
