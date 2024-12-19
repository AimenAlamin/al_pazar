import '../../../../../../core/helpers/error_state_dialog.dart';
import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/routing/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit/add_post_cubit.dart';

class AddPostListener extends StatelessWidget {
  const AddPostListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 75, 23, 23),
              ),
            ),
          );
        }
        if (state is AddPostSuccess) {
          context.pop(); //pop from the loading dialog
          context.pushReplacementNamed(Routes.mainView);
        }
        if (state is AddPostFailure) {
          setupErrorState(context, state.errmessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
