import 'package:flutter/material.dart';
import 'package:task/core/utils/size_utils.dart';
import 'widgets/login_button.dart';
import 'widgets/login_footer_text.dart';
import 'widgets/login_form.dart';
import 'widgets/logo_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                const LoginForm(),
                SizedBox(
                  height: getVerticalSize(
                    20,
                  ),
                ),
                const LoginButton(),
                SizedBox(
                  height: getVerticalSize(
                    10,
                  ),
                ),
                const LoginFooterText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
