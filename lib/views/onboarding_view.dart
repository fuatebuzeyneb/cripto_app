import 'package:cripto_app/models/onboarding_model.dart';
import 'package:cripto_app/views/auth_views/signup_view.dart';
import 'package:cripto_app/widgets/custom_button_widget.dart';
import 'package:cripto_app/widgets/helper/shared_preferences_funs.dart';
import 'package:cripto_app/widgets/text_widget.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoardingView';
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: onboardingContact.length,
                    itemBuilder: (_, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    OnBoardingVisitedFun();
                                    Navigator.pushReplacementNamed(
                                        context, SignUpView.id);
                                  },
                                  child: const TextWidget(
                                    text: "Skip",
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          SvgPicture.asset(
                            onboardingContact[i].image,
                            height: 300,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(onboardingContact.length,
                                  (index) => buildDot(index, context)),
                            ),
                          ),
                          TextWidget(
                            text: onboardingContact[i].title,
                            fontSize: 18,
                          ),
                          TextWidget(
                            text: onboardingContact[i].subTitle,
                            fontSize: 14,
                          ),
                        ],
                      );
                    }),
              ),
              CustomButtonWidget(
                  onTap: () {
                    if (currentIndex == onboardingContact.length - 1) {
                      OnBoardingVisitedFun();
                      Navigator.pushReplacementNamed(context, SignUpView.id);
                    } else {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    }
                  },
                  title: currentIndex == onboardingContact.length - 1
                      ? 'Create Account'
                      : 'Next'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  OnBoardingVisitedFun();
                  Navigator.pushReplacementNamed(context, SignUpView.id);
                },
                child: Text(
                  currentIndex == onboardingContact.length - 1
                      ? 'Login Now'
                      : '',
                  style: const TextStyle(
                      decoration: TextDecoration.underline, color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? AppColors.kPrimaryColor
            : AppColors.kPrimaryColorDark,
      ),
    );
  }
}
