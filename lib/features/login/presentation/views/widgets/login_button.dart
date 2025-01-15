import 'package:flutter/material.dart';
import 'package:task/core/utils/naviagtion_extentaions.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../core/widgets/custom_button_widget.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: getVerticalSize(55),
      color: AppColors.navyBlue,
      title: 'Login',
      onPressed: () {
        AppNavigation.navigateTo(context: context, routeName: '/home');
      },
    );
  }
}
