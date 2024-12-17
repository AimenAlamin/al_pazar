import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/custom_error_widget.dart';

import 'posts_listed_view.dart';

class PostsListedViewBlocBuilder extends StatelessWidget {
  const PostsListedViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPostCubit, FetchPostState>(
      builder: (context, state) {
        if (state is FetchPostSuccess) {
          return PostsListedview(
            posts: state.posts,
          );
        } else if (state is FetchPostFailure) {
          return CustomErrorWidget(errtext: state.message);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 75, 23, 23),
            ),
          );
        }
      },
    );
  }
}
