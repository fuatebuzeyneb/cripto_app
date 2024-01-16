import 'package:cripto_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.suffixIcon,
  });
  final String label;
  final Function(String)? onChanged;

  final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          } else if (label == 'Email Address' && !data.contains('@')) {
            return 'The email must contain @';
          } else if (label == 'Password' && data.length <= 6) {
            return 'The password must be 6 letters and numbers or more';
          }
          return null;
        },
        style: TextStyle(
            color: themeCubit.isDark
                ? AppColors.kWhiteColor
                : AppColors.kBlackColor),
        onChanged: onChanged,
        obscureText: label == 'Password'
            ? BlocProvider.of<AuthCubit>(context).obscurePasswordTextValue!
            : false,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(
            label,
            style: TextStyle(
                color: themeCubit.isDark
                    ? AppColors.kWhiteColor
                    : AppColors.kBlackColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: themeCubit.isDark
                    ? AppColors.kWhiteColor
                    : AppColors.kBlackColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: themeCubit.isDark
                    ? AppColors.kWhiteColor
                    : AppColors.kBlackColor),
          ),
        ),
      ),
    );
  }
}
