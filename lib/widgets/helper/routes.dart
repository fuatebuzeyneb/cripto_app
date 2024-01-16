import 'package:cripto_app/bottom_nav_bar.dart';
import 'package:cripto_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:cripto_app/views/auth_views/signin_view.dart';
import 'package:cripto_app/views/auth_views/signup_view.dart';
import 'package:cripto_app/views/home_view.dart';
import 'package:cripto_app/views/onboarding_view.dart';
import 'package:cripto_app/views/profile_view.dart';
import 'package:cripto_app/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  HomeView.id: (context) => const HomeView(),
  ProfileView.id: (context) => const ProfileView(),
  SplashView.id: (context) => const SplashView(),
  OnBoardingView.id: (context) => const OnBoardingView(),
  BottomNavBar.id: (context) => const BottomNavBar(),
  SignUpView.id: (context) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
  SignInView.id: (context) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
};
