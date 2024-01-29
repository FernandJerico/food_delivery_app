import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/theme.dart';

Container listProducts(Size sizes) {
  return Container(
    height: sizes.height * 0.3,
    width: sizes.width * 0.42,
    decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 1),
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: goldColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '3.9',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/chicken-burger.png',
            scale: 2,
          ),
        ),
        Text(
          'Chicken Burger',
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '100 gr chicken + tomato + cheese  Lettuce',
          style: GoogleFonts.poppins(
              fontSize: 10, fontWeight: FontWeight.bold, color: greyColor),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ 4.00',
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                ),
              ),
            )
          ],
        )
      ]),
    ),
  );
}
