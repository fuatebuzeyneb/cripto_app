import 'package:cripto_app/bottom_nav_bar.dart';
import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/views/auth_views/signin_view.dart';
import 'package:cripto_app/views/onboarding_view.dart';
import 'package:cripto_app/widgets/helper/cache_hekper.dart';
import 'package:cripto_app/widgets/helper/service_locator.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:cripto_app/widgets/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'SplashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      bool isOnBoardingVisited =
          getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;
      if (isOnBoardingVisited == true) {
        FirebaseAuth.instance.currentUser == null
            ? Navigator.pushReplacementNamed(context, SignInView.id)
            : FirebaseAuth.instance.currentUser!.emailVerified == true
                ? Navigator.pushReplacementNamed(context, BottomNavBar.id)
                : Navigator.pushReplacementNamed(context, SignInView.id);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.id);
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Text(AppStrings.appName,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: themeCubit.isDark
                  ? AppColors.kWhiteColor
                  : AppColors.kBlackColor,
            )
            // GoogleFonts.pacifico(
            //   textStyle: TextStyle(
            // color: themeCubit.isDark
            //     ? AppColors.kWhiteColor
            //     : AppColors.kBlackColor,
            //       letterSpacing: .5,
            //       fontSize: 50),
            // ),
            ),
      ),
    );
  }
}
