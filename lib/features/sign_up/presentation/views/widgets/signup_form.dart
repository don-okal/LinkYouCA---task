import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Full Name',
          icon: Icon(Icons.person_outline),
        ),
        SizedBox(height: 20),
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
        SizedBox(height: 20),
        CustomTextField(
          hintText: 'Confirm Password',
          icon: Icon(Icons.lock_outline),
          obscureText: true,
        ),
      ],
    );
  }
}
