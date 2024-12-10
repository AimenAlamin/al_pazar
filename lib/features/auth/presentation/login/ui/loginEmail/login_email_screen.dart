import '../../cubit/login_email_cubit.dart';
import 'email_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/theming/widgets/app_text_button.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/terms_and_conditions_text.dart';
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
                Text(
                  'Welcome To Kibzar',
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
                    verticalSpace(35),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
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
