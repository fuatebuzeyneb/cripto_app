import 'package:cripto_app/widgets/app_bar_widget.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit/theme_cubit.dart';

class LearnView extends StatelessWidget {
  const LearnView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBarWidget(
            title: 'Learn',
            bottom: TabBar(
              indicatorWeight: 5,
              indicatorColor: AppColors.kPrimaryColor,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.book,
                  size: 30,
                  color: themeCubit.isDark
                      ? AppColors.kWhiteColor
                      : AppColors.kBlackColor,
                )),
                Tab(
                  icon: Icon(
                    size: 30,
                    Icons.video_call,
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
            Icon(Icons.picture_as_pdf, size: 350),
            Icon(Icons.video_call_sharp, size: 350),
          ],
        ),
      ),
    );
  }
}
