import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/naviagtion_extentaions.dart';

class LoginFooterText extends StatelessWidget {
  const LoginFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.darkGrey14500,
        ),
        GestureDetector(
          onTap: () {
            AppNavigation.navigateAndReplacement(
                context: context, newRoute: '/signUp');
          },
          child: Text(
            'Sign Up',
            style: AppTextStyles.primary16500,
          ),
        ),
      ],
    );
  }
}
