import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/theming/widgets/app_text_button.dart';

import '../../../../core/routing/routes.dart';
import '../login/ui/terms_and_conditions_text.dart';
import 'ui/widgets/already_have_account_text.dart';

class OnBoardingSignupScreen extends StatelessWidget {
  const OnBoardingSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kibzar', style: TextStyles.font32BlueBold),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    AppTextButton(
                      buttonText: "Sign up with Email",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        context.pushNamed(Routes.signUpEmailScreen);
                      },
                    ),
                    verticalSpace(20),
                    Text(
                      'OR',
                      style: TextStyles.font12GrayMedium,
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: "Sign up with Phone",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        context.pushNamed(Routes.signUpPhoneScreen);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    //const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void validateThenDoSignup(BuildContext context) {
  //   if (context.read<SignupCubit>().formKey.currentState!.validate()) {
  //     context.read<SignupCubit>().emitSignupStates();
  //   }
  // }
}
