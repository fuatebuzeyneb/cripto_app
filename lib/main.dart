import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/firebase_options.dart';
import 'package:cripto_app/views/splash_view.dart';
import 'package:cripto_app/widgets/helper/cache_hekper.dart';
import 'package:cripto_app/widgets/helper/routes.dart';
import 'package:cripto_app/widgets/helper/service_locator.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemeCubit()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor:
              themeCubit.isDark ? AppColors.kMainColor : AppColors.kGrayColor,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: themeCubit.isDark
                ? AppColors.kPrimaryColorDark
                : AppColors.kWhiteColor,
          )),
      routes: routes,
      initialRoute: SplashView.id,
    );
  }
}
