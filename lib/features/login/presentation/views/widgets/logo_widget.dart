import 'package:flutter/material.dart';
import 'package:task/core/utils/app_text_styles.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.lock_outline,
          size: 80,
          color: Colors.lightBlueAccent,
        ),
        const SizedBox(height: 10),
        Text('Welcome Back!', style: AppTextStyles.primary20600),
      ],
    );
  }
}
