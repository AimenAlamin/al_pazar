import 'package:al_pazar/core/theming/widgets/app_text_form_field.dart';

import 'package:flutter/material.dart';

import '../../../../../../../core/helpers/app_regex.dart';
//import '../../../../../../../core/helpers/spacing.dart';

class PhoneAndPassword extends StatefulWidget {
  const PhoneAndPassword({super.key});

  @override
  State<PhoneAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<PhoneAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  // late TextEditingController passwordController;

  // @override
  // void initState() {
  //   super.initState();
  //   //passwordController = context.read<LoginCubit>().passwordController;
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
      // key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid number that starts with +90';
              }
            },
            //controller: context.read<LoginCubit>().emailController,
          ),
          //verticalSpace(28),
          // AppTextFormField(
          //   //controller: context.read<LoginCubit>().passwordController,
          //   hintText: 'Password',
          //   isObscureText: isObscureText,
          //   suffixIcon: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         isObscureText = !isObscureText;
          //       });
          //     },
          //     child: Icon(
          //       isObscureText ? Icons.visibility_off : Icons.visibility,
          //     ),
          //   ),
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter a valid password';
          //     }
          //   },
          // ),
          //verticalSpace(24),
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
