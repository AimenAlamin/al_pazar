import 'package:bloc/bloc.dart';

import '../../../features/add_post/domain/entities/post_entity.dart';
import '../../../features/add_post/domain/repos/posts_repo/post_repo.dart';

part 'fetch_post_state.dart';

class FetchPostCubit extends Cubit<FetchPostState> {
  FetchPostCubit(this.postRepo) : super(FetchPostInitial());
  final PostRepo postRepo;
  Future<void> fetchPosts() async {
    emit(FetchPostLoading());
    final posts = await postRepo.getPosts();
    posts.fold(
      (failure) => emit(FetchPostFailure(failure.message)),
      (posts) => emit(FetchPostSuccess(posts)),
    );
  }
}
