import 'package:bloc/bloc.dart';

import '../../../features/add_post/domain/entities/post_entity.dart';
import '../../../features/add_post/domain/repos/posts_repo/post_repo.dart';

part 'fetch_post_state.dart';

class FetchPostCubit extends Cubit<FetchPostState> {
  FetchPostCubit(this.postRepo) : super(FetchPostInitial());
  final PostRepo postRepo;

  //int noOfPosts = 0;
  Future<void> fetchPosts() async {
    emit(FetchPostLoading());
    final posts = await postRepo.getPosts();
    posts.fold((failure) => emit(FetchPostFailure(failure.message)), (posts) {
      //noOfPosts = posts.length;
      //if using pagination do  noOfPosts += posts.length;
      emit(FetchPostSuccess(posts));
    });
  }

  //Filtered fetching
  Future<void> filterPosts({
    String? searchText,
    String? category,
    String? subcategory,
    String? location,
  }) async {
    emit(FetchPostLoading());
    final posts = await postRepo.filterPosts(
      searchText: searchText,
      category: category,
      subcategory: subcategory,
      location: location,
    );
    posts.fold((failure) => emit(FetchPostFailure(failure.message)), (posts) {
      emit(FetchPostSuccess(posts));
    });
  }
}
