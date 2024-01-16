import 'package:cripto_app/cubit/packages_cubit/packages_cubit.dart';
import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/widgets/custom_button_widget.dart';
import 'package:cripto_app/widgets/helper/toast_msg.dart';
import 'package:cripto_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_packages_widget.dart';
import '../widgets/list_title_widget.dart';
import '../widgets/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });
  static String id = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBarWidget(
          title: 'Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const TextWidget(
                    text: 'What\'s up  ',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  Text(
                    'njh',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              ListTitleWidget(
                icon: Icons.person,
                text: 'Fuat Ebuzeyneb',
                widget: Icon(
                  Icons.edit,
                  color: themeCubit.isDark
                      ? AppColors.kWhiteColor
                      : AppColors.kBlackColor,
                ),
              ),
              ListTitleWidget(
                icon: Icons.mail,
                text: 'fuatebuzeyneb@gmail.com',
                widget: Icon(
                  Icons.edit,
                  color: themeCubit.isDark
                      ? AppColors.kWhiteColor
                      : AppColors.kBlackColor,
                ),
              ),
              ListTitleWidget(
                icon: Icons.lock,
                text: 'Restart Password',
                widget: Icon(
                  Icons.edit,
                  color: themeCubit.isDark
                      ? AppColors.kWhiteColor
                      : AppColors.kBlackColor,
                ),
              ),
              ListTitleWidget(
                icon: themeCubit.isDark ? Icons.dark_mode : Icons.light_mode,
                text: 'Mode',
                widget: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                  ),
                  onPressed: () {
                    themeCubit.changeTheme();
                  },
                  child: Text(themeCubit.isDark ? 'Dark' : 'Light'),
                ),
              ),
              ListTitleWidget(
                icon: Icons.translate,
                text: 'Langues',
                widget: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                  ),
                  onPressed: () {},
                  child: Text(themeCubit.isDark ? 'EN' : 'AR'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButtonWidget(title: 'Logout', onTap: () {}),
              const SizedBox(
                height: 8,
              ),
              const Row(
                children: [
                  TextWidget(
                    text: 'Packages',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: size.width * 0.5,
                child: BlocConsumer<PackagesCubit, PackagesState>(
                  listener: (context, state) {
                    if (state is PackagesFailure) {
                      toastMsg(errorMsg: state.massError);
                    }
                  },
                  builder: (context, state) {
                    return state is PackagesLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: BlocProvider.of<PackagesCubit>(context)
                                .packagesModelList
                                .length,
                            itemBuilder: (context, index) {
                              return CardPackageWidget(
                                packagesModel:
                                    BlocProvider.of<PackagesCubit>(context)
                                        .packagesModelList[index],
                              );
                            });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
