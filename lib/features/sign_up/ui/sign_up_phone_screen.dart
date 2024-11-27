import 'package:al_pazar/features/sign_up/ui/widgets/sign_up_phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/theming/widgets/app_text_button.dart';
import '../../login/ui/terms_and_conditions_text.dart';
import 'widgets/already_have_account_text.dart';

class SignupPhoneScreen extends StatelessWidget {
  const SignupPhoneScreen({super.key});

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
                  'Sign up with Phone',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupPhoneForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        //validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    //const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
