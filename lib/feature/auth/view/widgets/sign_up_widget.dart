import 'package:chat_app/core/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        CustomTextFormField(label: 'Username', controller: usernameController),
        CustomTextFormField(label: 'Email', controller: emailController),
        CustomTextFormField(label: 'Password', controller: passController),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: () {}, child: const Text('Sign In')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
          ],
        ),
      ],
    );
  }
}
