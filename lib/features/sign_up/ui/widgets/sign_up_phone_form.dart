import 'package:al_pazar/core/helpers/app_regex.dart';
import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/theming/widgets/app_text_form_field.dart';
import 'package:al_pazar/features/login/ui/password_validations.dart';
import 'package:flutter/material.dart';

class SignupPhoneForm extends StatefulWidget {
  const SignupPhoneForm({super.key});

  @override
  State<SignupPhoneForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupPhoneForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  // late TextEditingController passwordController;

  // @override
  // void initState() {
  //   super.initState();
  //   passwordController = context.read<SignupCubit>().passwordController;
  //   setupPasswordControllerListener();
  // }

  // void setupPasswordControllerListener() {
  //   passwordController.addListener(() {
  //     setState(() {
  //       hasLowercase = AppRegex.hasLowerCase(passwordController.text);
  //       hasUppercase = AppRegex.hasUpperCase(passwordController.text);
  //       hasSpecialCharacters =
  //           AppRegex.hasSpecialCharacter(passwordController.text);
  //       hasNumber = AppRegex.hasNumber(passwordController.text);
  //       hasMinLength = AppRegex.hasMinLength(passwordController.text);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            //controller: context.read<SignupCubit>().nameController,
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
            keyboardType: TextInputType.phone,
            hintText: 'Phone',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number that starts with +90';
              }
            },
            // controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            //controller: context.read<SignupCubit>().passwordController,
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
          verticalSpace(18),
          AppTextFormField(
            // controller:
            //     context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
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

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
