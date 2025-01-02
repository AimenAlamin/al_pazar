import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/custom_error_widget.dart';

import 'popular_listview_items.dart';

class PopularListViewBlocBuilder extends StatelessWidget {
  const PopularListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPostCubit, FetchPostState>(
      builder: (context, state) {
        if (state is FetchPostSuccess) {
          return PopularListviewItems(
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
