import '../../../../../../core/theming/widgets/app_text_form_field.dart';
import '../../cubit/login_email_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/helpers/spacing.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  // bool hasLowercase = false;
  // bool hasUppercase = false;
  // bool hasSpecialCharacters = false;
  // bool hasNumber = false;
  // bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginEmailCubit>().passwordController;
    //setupPasswordControllerListener();
  }

  // // void setupPasswordControllerListener() {
  // //   passwordController.addListener(() {
  // //     setState(() {
  // //       hasLowercase = AppRegex.hasLowerCase(passwordController.text);
  // //       hasUppercase = AppRegex.hasUpperCase(passwordController.text);
  // //       hasSpecialCharacters =
  // //           AppRegex.hasSpecialCharacter(passwordController.text);
  // //       hasNumber = AppRegex.hasNumber(passwordController.text);
  // //       hasMinLength = AppRegex.hasMinLength(passwordController.text);
  // //     });
  // //   });
  // // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginEmailCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginEmailCubit>().emailController,
          ),
          verticalSpace(28),
          AppTextFormField(
            controller: context.read<LoginEmailCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
