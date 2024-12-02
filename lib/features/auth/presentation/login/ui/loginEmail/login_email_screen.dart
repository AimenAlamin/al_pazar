import 'package:al_pazar/features/auth/presentation/login/cubit/login_email_cubit.dart';
import 'package:al_pazar/features/auth/presentation/login/ui/loginEmail/email_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/theming/widgets/app_text_button.dart';
import 'login_email_listener.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button at the top
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(
                            context); // Go back to the previous screen
                      },
                    ),
                  ],
                ),

                // Screen title
                Text(
                  'Log in with Email',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(34),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLoginEmail(context);
                      },
                    ),
                    const LoginEmailBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLoginEmail(BuildContext context) {
    if (context.read<LoginEmailCubit>().formKey.currentState!.validate()) {
      context.read<LoginEmailCubit>().loginWithEmailAndPassword();
    }
  }
}
