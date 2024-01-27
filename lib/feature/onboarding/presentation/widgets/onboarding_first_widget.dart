import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/onboarding-pattern-top.png'),
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/images/onboarding-first.png'),
        Column(
          children: [
            Text(
              'Select the\nFavorities Menu',
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Now eat well, don\'t leave the house, You can\nchoose your favorite food only with\none click',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            )
          ],
        )
      ],
    );
  }
}
