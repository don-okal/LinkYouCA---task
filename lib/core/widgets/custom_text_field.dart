import 'package:flutter/material.dart';
import 'package:task/core/utils/size_utils.dart';

import '../utils/app_border.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.icon,
    this.keyboardType,
    this.suffix,
    this.textEditingController,
    this.obscureText = false,
  });
  final TextEditingController? textEditingController;
  final String hintText;
  final Widget? icon, suffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(
              12,
            ),
          ),
          child: icon,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        prefixIconConstraints: BoxConstraints(
          minHeight: AppSizes.iconsSizes,
          maxHeight: AppSizes.iconsSizes,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.grey14300,
        enabledBorder: AppBorder.textFieldBorder,
        focusedBorder: AppBorder.focusTextFieldBorder,
        errorBorder: AppBorder.errorTextFieldBorder,
      ),
    );
  }
}
