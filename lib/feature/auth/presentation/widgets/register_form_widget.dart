import 'package:flutter/material.dart';
import 'package:food_delivery_app/feature/auth/presentation/widgets/auth_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/theme.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    super.key,
    required this.sizes,
  });

  final Size sizes;

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildForm(
                  'Full Name', 'Enter Full Name', false, fullnameController),
              const SizedBox(
                height: 16,
              ),
              buildForm(
                  'Email Address', 'example@gmail.com', false, emailController),
              const SizedBox(
                height: 16,
              ),
              buildForm('Password', '**** **** ****', true, passwordController),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 48,
                width: sizes.width * 0.7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: whiteColor),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 48,
                width: sizes.width * 0.7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightGreyColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/ic_google.png'),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Sign Up With Google',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: blackColor),
                        ),
                      ],
                    )),
              )
            ],
          )),
        ],
      ),
    );
  }
}
