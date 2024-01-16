import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.text, this.fontSize = 12, this.fontWeight});
  final String text;
  final double fontSize;

  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color:
            themeCubit.isDark ? AppColors.kWhiteColor : AppColors.kBlackColor,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }
}
