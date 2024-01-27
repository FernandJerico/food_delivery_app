import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/onboarding-pattern-top.png'),
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/images/onboarding-last.png'),
        Column(
          children: [
            Text(
              'Good food at a\ncheap price',
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'You can eat at expensive\nrestaurants with affordable price',
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
