import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/feature/onboarding/presentation/widgets/onboarding_first_widget.dart';
import 'package:food_delivery_app/feature/onboarding/presentation/widgets/onboarding_second_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/theme.dart';
import '../../../auth/presentation/pages/auth_screen.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(children: [
              Expanded(
                  child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      BlocProvider.of<OnboardingBloc>(context)
                          .add(OnboardingEvent());
                      debugPrint(value.toString());
                    },
                    children: const [
                      OnboardingFirst(),
                      OnboardingSecond(),
                    ],
                  ),
                  Positioned(
                      bottom: sizes.height * 0.15,
                      width: sizes.width - 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 6,
                            width: state.page == index ? 42 : 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: state.page == index
                                  ? primaryColor
                                  : state.page > index
                                      ? primaryColor
                                      : secondaryColor,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    bottom: 35,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFD61355), Color(0xFFFF0000)],
                          )),
                      height: 50,
                      width: 335,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            if (state.page < 1) {
                              pageController.animateToPage(
                                state.page + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const AuthScreen();
                                },
                              ));
                            }
                          },
                          child: Text(
                            state.page < 1 ? 'Get Started' : 'Next',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: state.page > 0
                                  ? FontWeight.w500
                                  : FontWeight.bold,
                              color: whiteColor,
                            ),
                          )),
                    ),
                  )
                ],
              ))
            ]),
          );
        },
      ),
    );
  }
}
