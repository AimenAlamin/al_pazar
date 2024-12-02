import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/login_email_cubit.dart';

class LoginEmailBlocListener extends StatelessWidget {
  const LoginEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginEmailCubit, LoginEmailState>(
      listener: (context, state) {
        if (state is LoginEmailLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 75, 23, 23),
              ),
            ),
          );
        }
        if (state is LoginEmailSuccess) {
          context.pop(); //pop from the loading dialog
          context.pushNamed(Routes.homeScreen);
        }
        if (state is LoginEmailFailure) {
          setupErrorState(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop(); //pop from the loading dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
