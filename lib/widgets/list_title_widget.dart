import 'package:cripto_app/widgets/text_widget.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit/theme_cubit.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.text,
    required this.widget,
    required this.icon,
  });
  final String text;
  final Widget widget;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: themeCubit.isDark
              ? AppColors.kPrimaryColorDark
              : AppColors.kWhiteColor,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: themeCubit.isDark
                ? AppColors.kWhiteColor
                : AppColors.kBlackColor,
          ),
          title: Row(
            children: [
              TextWidget(
                text: text,
                fontSize: 16,
              ),
            ],
          ),
          trailing: widget,
        ),
      ),
    );
  }
}
