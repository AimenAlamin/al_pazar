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

  //Filtered by categoy fetching
  Future<void> fetchPostsByCategory(String categoryName) async {
    emit(FetchPostLoading());
    final posts = await postRepo.getFilteredPosts(categoryName);
    posts.fold((failure) => emit(FetchPostFailure(failure.message)), (posts) {
      //noOfPosts = posts.length;
      //if using pagination do  noOfPosts += posts.length;
      emit(FetchPostSuccess(posts));
    });
  }

  // Filtered by subcategory
  Future<void> fetchPostsBySubCategory(String subCategoryName) async {
    emit(FetchPostLoading());
    final posts = await postRepo.getSubCategoryFilteredPosts(subCategoryName);
    posts.fold((failure) => emit(FetchPostFailure(failure.message)), (posts) {
      //noOfPosts = posts.length;
      //if using pagination do  noOfPosts += posts.length;
      emit(FetchPostSuccess(posts));
    });
  }
}
