import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextField(
          hintText: 'Email Address',
          icon: Icon(Icons.email_outlined),
        ),
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Password',
          icon: Icon(Icons.lock_outline),
          obscureText: true,
        ),
      ],
    );
  }
}
