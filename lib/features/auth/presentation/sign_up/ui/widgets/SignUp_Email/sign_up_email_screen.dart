import 'package:al_pazar/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:al_pazar/features/auth/presentation/sign_up/ui/widgets/SignUp_Email/sign_up_email_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/styles.dart';
import '../../../../../../../core/theming/widgets/app_text_button.dart';
import '../../../../login/ui/widgets/terms_and_conditions_text.dart';
import '../already_have_account_text.dart';
import 'sign_up_email_listener.dart';

class SignupEmailScreen extends StatelessWidget {
  const SignupEmailScreen({super.key});

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
                // Screen title
                Text(
                  'Sign up with Email',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupEmailForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignupEmail(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignUpEmailBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignupEmail(BuildContext context) {
    if (context.read<SignUpEmailCubit>().formKey.currentState!.validate()) {
      context.read<SignUpEmailCubit>().signUpWithEmailAndPassword();
    }
  }
}
