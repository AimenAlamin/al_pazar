import 'package:al_pazar/core/helpers/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/theming/widgets/app_text_button.dart';

import '../../../../core/routing/routes.dart';
import '../login/ui/widgets/terms_and_conditions_text.dart';

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
                  'Welcome',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    AppTextButton(
                      buttonText: "Continue with Email",
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
                    // AppTextButton(
                    //   buttonText: "Continue with Phone",
                    //   textStyle: TextStyles.font16WhiteSemiBold,
                    //   onPressed: () {
                    //     context.pushNamed(Routes.phoneScreen);
                    //   },
                    // ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
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
