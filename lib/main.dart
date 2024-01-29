import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/feature/splash/splash_screen.dart';

import 'feature/home/presentation/bloc/category/category_bloc.dart';
import 'feature/onboarding/presentation/bloc/onboarding_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
      ],
      child: const MaterialApp(
        title: 'Food Delivery App',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
