import 'dart:io';

import 'package:chat_app/core/components/custom_text_form_field.dart';
import 'package:chat_app/core/constants.dart';
import 'package:chat_app/core/utils/custom_file_picker.dart';
import 'package:chat_app/core/utils/custom_regex.dart';
import 'package:chat_app/feature/auth/view_model/auth_provider.dart';
import 'package:chat_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpWidget extends ConsumerStatefulWidget {
  const SignUpWidget({super.key});

  @override
  ConsumerState<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends ConsumerState<SignUpWidget> {
  final emailController = TextEditingController();

  final passController = TextEditingController();

  final usernameController = TextEditingController();

  String? profileImage;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            GestureDetector(
              onTap: () async {
                final image = await CustomFilePicker.pickImage();

                if (image == null) return;

                setState(() {
                  profileImage = image;
                  debugPrint('profileImage: $profileImage');
                });
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    profileImage == null
                        ? AssetImage(defaultUserProfile)
                        : FileImage(File(profileImage!)),
              ),
            ),

            CustomTextFormField(
              label: 'Username',
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (CustomRegex.isValidUsername(
                      usernameController.text,
                    ) ==
                    false) {
                  return 'Please enter a valid username';
                }
                return null;
              },
            ),
            CustomTextFormField(
              label: 'Email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                } else if (CustomRegex.isValidEmail(emailController.text) ==
                    false) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            CustomTextFormField(
              label: 'Password',
              controller: passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (CustomRegex.isValidPassword(passController.text) ==
                    false) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            CustomTextFormField(
              label: 'Confirm Password',
              controller: null,
              validator: (value) {
                if (passController.text != value) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (!(_formKey.currentState?.validate() ?? false)) {
                      debugPrint('form is invalid');
                      return;
                    }

                    await ref
                        .read(authProvider)
                        .signUp(
                          usernameController.text,
                          emailController.text,
                          passController.text,
                          profileImage,
                        );
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
