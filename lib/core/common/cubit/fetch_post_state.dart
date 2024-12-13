part of 'fetch_post_cubit.dart';

abstract class FetchPostState {}

final class FetchPostInitial extends FetchPostState {}

final class FetchPostLoading extends FetchPostState {}

final class FetchPostSuccess extends FetchPostState {
  final List<PostEntity> posts;
  FetchPostSuccess(this.posts);
}

final class FetchPostFailure extends FetchPostState {
  final String message;
  FetchPostFailure(this.message);
}
