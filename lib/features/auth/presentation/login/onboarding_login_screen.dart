import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/widgets/app_text_button.dart';
import 'ui/widgets/dont_have_account.dart';
import 'ui/widgets/terms_and_conditions_text.dart';

class OnBoardingLoginScreen extends StatelessWidget {
  const OnBoardingLoginScreen({super.key});

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
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    AppTextButton(
                      buttonText: "Log in with Email",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        context.pushNamed(Routes.loginEmailScreen);
                      },
                    ),
                    verticalSpace(20),
                    Text(
                      'OR',
                      style: TextStyles.font12GrayMedium,
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: "Log in with Phone",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        context.pushNamed(Routes.loginPhoneScreen);
                      },
                    ),
                    verticalSpace(35),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
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
}
