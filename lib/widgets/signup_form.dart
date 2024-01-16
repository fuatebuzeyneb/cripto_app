import 'package:cripto_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/views/auth_views/signin_view.dart';
import 'package:cripto_app/widgets/custom_button_widget.dart';
import 'package:cripto_app/widgets/helper/toast_msg.dart';
import 'package:cripto_app/widgets/text_field_widget.dart';
import 'package:cripto_app/widgets/text_widget.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:cripto_app/widgets/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          toastMsg(
              errorMsg:
                  'Successfully, check your email to verify your account');
          Navigator.pushReplacementNamed(context, SignInView.id);
        } else if (state is SignUpFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.formKeyForSignUp,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    text: 'Welcome To  ',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  Text(AppStrings.appName,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: themeCubit.isDark
                            ? AppColors.kWhiteColor
                            : AppColors.kBlackColor,
                      )
                      // style: GoogleFonts.lobster(
                      //   textStyle: TextStyle(
                      //       color: themeCubit.isDark
                      //           ? AppColors.kWhiteColor
                      //           : AppColors.kBlackColor,
                      //       letterSpacing: .5,
                      //       fontSize: 30),
                      // ),
                      ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFieldWidget(
                label: 'First Name',
                onChanged: (value) {
                  authCubit.name = value;
                },
              ),
              TextFieldWidget(
                label: 'Last Name',
                onChanged: (value) {
                  authCubit.lastName = value;
                },
              ),
              TextFieldWidget(
                label: 'Email Address',
                onChanged: (value) {
                  authCubit.email = value;
                },
              ),
              TextFieldWidget(
                suffixIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).obscurePasswordText();
                  },
                  icon: authCubit.obscurePasswordTextValue == false
                      ? Icon(
                          Icons.visibility,
                          color: themeCubit.isDark
                              ? AppColors.kWhiteColor
                              : AppColors.kBlackColor,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: themeCubit.isDark
                              ? AppColors.kWhiteColor
                              : AppColors.kBlackColor,
                        ),
                ),
                onChanged: (value) {
                  authCubit.password = value;
                },
                label: 'Password',
              ),
              SizedBox(
                height: size.height * 0.18,
              ),
              state is SignUpLoading
                  ? const CircularProgressIndicator()
                  : CustomButtonWidget(
                      title: 'Sign Up',
                      onTap: () async {
                        if (authCubit.formKeyForSignUp.currentState!
                            .validate()) {
                          await authCubit.signUpUserWithEmailAndPassword();
                        } else {
                          toastMsg(
                              errorMsg:
                                  'You must agree to the terms and condition');
                        }
                      }),
              SizedBox(
                height: size.height * 0.017,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    text: 'Already have an account?  ',
                    fontSize: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignInView.id);
                    },
                    child: const TextWidget(
                      text: 'Sign In',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
