import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width = double.infinity,
      this.textStyle,
      required this.title,
      required this.onPressed,
      this.color = AppColors.primaryColor,
      this.height,
      this.colorBorder});

  final void Function() onPressed;
  final String title;

  final Color? color;
  final Color? colorBorder;
  final double? height, width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? getVerticalSize(52),
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  color: colorBorder ?? Colors.transparent, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ?? AppTextStyles.white20600,
        ),
      ),
    );
  }
}
