import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/models/packages_model.dart';
import 'package:cripto_app/widgets/text_widget.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPackageWidget extends StatelessWidget {
  const CardPackageWidget({
    super.key,
    required this.packagesModel,
  });
  final PackagesModel packagesModel;
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: themeCubit.isDark
              ? AppColors.kPrimaryColorDark
              : AppColors.kWhiteColor,
        ),
        height: size.width * 0.5,
        width: size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextWidget(
              text: packagesModel.title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              text: '\$${packagesModel.price}',
              fontSize: 16,
            ),
            TextWidget(
              text: packagesModel.subtitle,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                ),
                onPressed: () {
                  // themeCubit.changeTheme();
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
