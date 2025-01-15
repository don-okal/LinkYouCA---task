import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/naviagtion_extentaions.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../core/widgets/custom_button_widget.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: getVerticalSize(55),
      color: AppColors.navyBlue,
      title: 'Sign Up',
      onPressed: () {
        AppNavigation.navigateTo(context: context, routeName: '/home');
      },
    );
  }
}
