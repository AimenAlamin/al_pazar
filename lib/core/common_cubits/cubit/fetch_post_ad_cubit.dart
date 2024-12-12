import 'package:bloc/bloc.dart';

import '../../../features/add_post/domain/entities/post_entity.dart';
import '../../../features/add_post/domain/repos/posts_repo/post_repo.dart';

part 'fetch_post_ad_state.dart';

class FetchPostAdCubit extends Cubit<FetchPostAdState> {
  FetchPostAdCubit(this.postRepo) : super(FetchPostAdInitial());
  final PostRepo postRepo;
  Future<void> fetchPosts() async {
    emit(FetchPostAdLoading());
    final posts = await postRepo.getPosts();
    posts.fold(
      (failure) => emit(FetchPostAdFailure(failure.message)),
      (posts) => emit(FetchPostAdSuccess(posts)),
    );
  }
}
