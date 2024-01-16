import 'package:cripto_app/cubit/home_cubit/home_cubit.dart';
import 'package:cripto_app/widgets/card_home_widget.dart';
import 'package:cripto_app/widgets/helper/toast_msg.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit/theme_cubit.dart';
import '../widgets/app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFailure) {
          toastMsg(errorMsg: state.massError);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(55),
              child: AppBarWidget(
                title: 'Home',
                icon: Icon(
                  Icons.menu,
                  color: themeCubit.isDark
                      ? AppColors.kWhiteColor
                      : AppColors.kBlackColor,
                ),
              ),
            ),
            body: state is HomeLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: BlocProvider.of<HomeCubit>(context)
                                  .homeModelList
                                  .length,
                              itemBuilder: (context, index) {
                                return CardHomeWidget(
                                  homeModel: BlocProvider.of<HomeCubit>(context)
                                      .homeModelList[index],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
