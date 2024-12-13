import 'package:al_pazar/core/helpers/loading_dialog.dart';

import '../../../../../../core/helpers/error_state_dialog.dart';
import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/routing/routes.dart';

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
          customLoadingDialog(context);
        }
        if (state is LoginEmailSuccess) {
          context.pop(); //pop from the loading dialog
          context.pushReplacementNamed(Routes.mainView);
        }
        if (state is LoginEmailFailure) {
          setupErrorState(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
