import 'package:cripto_app/widgets/signin_form.dart';

import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static String id = 'SignInView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SignInForm(),
        ),
      ),
    );
  }
}
