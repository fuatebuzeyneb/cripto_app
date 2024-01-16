import 'package:cripto_app/bottom_nav_bar.dart';
import 'package:cripto_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/views/auth_views/signup_view.dart';
import 'package:cripto_app/widgets/custom_button_widget.dart';
import 'package:cripto_app/widgets/helper/toast_msg.dart';
import 'package:cripto_app/widgets/text_field_widget.dart';
import 'package:cripto_app/widgets/text_widget.dart';
import 'package:cripto_app/widgets/utils/app_assets.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:cripto_app/widgets/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? Navigator.pushReplacementNamed(context, BottomNavBar.id)
              : toastMsg(errorMsg: 'Please check your email inbox');
        } else if (state is SignInFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Column(
          children: [
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              color: AppColors.kPrimaryColorDark,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.appName,
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                          color: themeCubit.isDark
                              ? AppColors.kWhiteColor
                              : AppColors.kBlackColor,
                          letterSpacing: .5,
                          fontSize: 50),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Image.asset(
                    AppAssets.kIconApp,
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: authCubit.formKeyForSignIn,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    const TextWidget(
                      text: 'Welcome Back !',
                      fontSize: 26,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
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
                          authCubit.obscurePasswordText();
                        },
                        icon: authCubit.obscurePasswordTextValue == true
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
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const TextWidget(
                            text: 'Forget Password?',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.11,
                    ),
                    state is SignInLoading
                        ? const CircularProgressIndicator()
                        : CustomButtonWidget(
                            title: 'Sign In',
                            onTap: () async {
                              if (authCubit.formKeyForSignIn.currentState!
                                  .validate()) {
                                await authCubit
                                    .signInUserWithEmailAndPassword();
                              } else {}
                            },
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
                          text: 'Don\'t have an account?  ',
                          fontSize: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, SignUpView.id);
                          },
                          child: const TextWidget(
                            text: 'Sign Up',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
