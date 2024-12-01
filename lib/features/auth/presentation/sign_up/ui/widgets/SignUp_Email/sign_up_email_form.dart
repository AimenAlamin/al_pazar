import 'package:al_pazar/core/helpers/app_regex.dart';
import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/theming/widgets/app_text_form_field.dart';
import 'package:al_pazar/features/auth/presentation/sign_up/ui/widgets/password_validations.dart';
import 'package:al_pazar/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupEmailForm extends StatefulWidget {
  const SignupEmailForm({super.key});

  @override
  State<SignupEmailForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupEmailForm> {
  bool isPasswordObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpEmailCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpEmailCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignUpEmailCubit>().nameController,
          ),
          verticalSpace(18),
          // AppTextFormField(
          //   hintText: 'Phone number',
          //  // controller: context.read<SignupCubit>().phoneController,
          //   keyboardType: TextInputType.phone,
          //   prefixIcon: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     child: SvgPicture.asset("assets/svgs/jordan_flag.svg"),
          //   ),
          //   prefixText: '+90  ',

          // ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter valid email ending with .edu.tr';
              }
            },
            controller: context.read<SignUpEmailCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignUpEmailCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),

          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
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
