import 'package:flutter/material.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../login/presentation/views/widgets/logo_widget.dart';
import 'widgets/signup_button.dart';
import 'widgets/signup_footer_text.dart';
import 'widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                SizedBox(
                  height: getVerticalSize(
                    40,
                  ),
                ),
                const SignUpForm(),
                SizedBox(
                  height: getVerticalSize(
                    20,
                  ),
                ),
                const SignUpButton(),
                SizedBox(
                  height: getVerticalSize(
                    10,
                  ),
                ),
                const SignUpFooterText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
