import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/themes/theme.dart';
import 'package:food_delivery_app/feature/auth/presentation/widgets/login_form_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/register_form_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset('assets/images/onboarding-pattern-top.png'),
                Image.asset('assets/images/onboarding-last.png')
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                width: sizes.width,
                height: sizes.height * 0.65,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        height: 10,
                        width: 72,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: sizes.height * 0.65,
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: <Widget>[
                              TabBar(
                                labelColor: primaryColor,
                                indicatorColor: primaryColor,
                                labelStyle: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                dividerColor: Colors.transparent,
                                tabs: const [
                                  Tab(
                                    text: 'Create Account',
                                  ),
                                  Tab(
                                    text: 'Login',
                                  )
                                ],
                              ),
                              Expanded(
                                  child: TabBarView(
                                children: [
                                  RegisterFormWidget(sizes: sizes),
                                  LoginFormWidget(sizes: sizes)
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
