import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../config/themes/theme.dart';
import 'auth_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required this.sizes,
  });

  final Size sizes;

  @override
  Widget build(BuildContext context) {
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
                  'Email Address', 'example@gmail.com', false, emailController),
              const SizedBox(
                height: 16,
              ),
              buildForm('Password', '**** **** ****', true, passwordController),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: GradientText(
                    'Forgot Password?',
                    colors: const [Color(0xFFD61355), Color(0xFFFF0000)],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFD61355), Color(0xFFFF0000)],
                  ),
                ),
                height: 48,
                width: sizes.width * 0.7,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                ),
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
                          'Login With Google',
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
