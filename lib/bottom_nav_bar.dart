import 'package:cripto_app/cubit/articles_cubit/articles_cubit.dart';
import 'package:cripto_app/cubit/home_cubit/home_cubit.dart';
import 'package:cripto_app/cubit/packages_cubit/packages_cubit.dart';
import 'package:cripto_app/views/articles_and_news_views/articles_and_news_view.dart';
import 'package:cripto_app/views/home_view.dart';
import 'package:cripto_app/views/learn_view.dart';
import 'package:cripto_app/views/profile_view.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'cubit/theme_cubit/theme_cubit.dart';

PersistentTabController _controller = PersistentTabController();

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  static String id = 'BottomNavBar';

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      backgroundColor: themeCubit.isDark
          ? AppColors.kPrimaryColorDark
          : AppColors.kWhiteColor,
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      navBarStyle: NavBarStyle.style13,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: HomeView(),
    ),
    const LearnView(),
    BlocProvider(
      create: (context) => ArticlesCubit()..getArticlesData(),
      child: const ArticlesAndNewsView(),
    ),
    BlocProvider(
      create: (context) => PackagesCubit()..getPackagesData(),
      child: const ProfileView(),
    )
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: AppColors.kPrimaryColor,
      inactiveColorPrimary:
          themeCubit.isDark ? AppColors.kWhiteColor : AppColors.kBlackColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.school),
      title: ("Home"),
      activeColorPrimary: AppColors.kPrimaryColor,
      inactiveColorPrimary:
          themeCubit.isDark ? AppColors.kWhiteColor : AppColors.kBlackColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.newspaper),
      title: ("Home"),
      activeColorPrimary: AppColors.kPrimaryColor,
      inactiveColorPrimary:
          themeCubit.isDark ? AppColors.kWhiteColor : AppColors.kBlackColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("Home"),
      activeColorPrimary: AppColors.kPrimaryColor,
      inactiveColorPrimary:
          themeCubit.isDark ? AppColors.kWhiteColor : AppColors.kBlackColor,
    ),
  ];
}
