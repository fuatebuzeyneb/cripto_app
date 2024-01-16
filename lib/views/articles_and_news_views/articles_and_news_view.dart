import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/views/articles_and_news_views/articles_view.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_bar_widget.dart';

class ArticlesAndNewsView extends StatelessWidget {
  const ArticlesAndNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBarWidget(
            title: 'Articles & News',
            bottom: TabBar(
              indicatorWeight: 5,
              indicatorColor: AppColors.kPrimaryColor,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.article,
                  size: 30,
                  color: themeCubit.isDark
                      ? AppColors.kWhiteColor
                      : AppColors.kBlackColor,
                )),
                Tab(
                  icon: Icon(
                    size: 30,
                    Icons.newspaper,
                    color: themeCubit.isDark
                        ? AppColors.kWhiteColor
                        : AppColors.kBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            ArticlesView(),
            Icon(Icons.newspaper, size: 350),
          ],
        ),
      ),
    );
  }
}
