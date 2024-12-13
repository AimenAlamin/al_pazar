import 'package:al_pazar/core/common/cubit/fetch_post_cubit.dart';
import 'package:al_pazar/core/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../add_post/domain/repos/posts_repo/post_repo.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchPostCubit(getIt<PostRepo>()),
      child: const HomeViewBody(),
    );
  }
}
