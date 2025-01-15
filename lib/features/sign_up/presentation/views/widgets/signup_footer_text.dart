import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/naviagtion_extentaions.dart';

class SignUpFooterText extends StatelessWidget {
  const SignUpFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: AppTextStyles.darkGrey14500,
        ),
        GestureDetector(
          onTap: () {
            AppNavigation.navigateAndReplacement(
                context: context, newRoute: '/login');
          },
          child: Text(
            'Login',
            style: AppTextStyles.primary16500,
          ),
        ),
      ],
    );
  }
}
