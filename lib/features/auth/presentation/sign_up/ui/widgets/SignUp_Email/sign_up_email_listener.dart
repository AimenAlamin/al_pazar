import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:al_pazar/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpEmailBlocListener extends StatelessWidget {
  const SignUpEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpEmailCubit, SignUpEmailState>(
      listener: (context, state) {
        if (state is SignUpEmailLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 75, 23, 23),
              ),
            ),
          );
        }
        if (state is SignUpEmailSuccess) {
          context.pop(); //pop from the loading dialog
          context.pushNamed(Routes.homeScreen);
        }
        if (state is SignUpEmailFailure) {
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
