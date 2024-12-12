part of 'fetch_post_ad_cubit.dart';

abstract class FetchPostAdState {}

final class FetchPostAdInitial extends FetchPostAdState {}

final class FetchPostAdLoading extends FetchPostAdState {}

final class FetchPostAdSuccess extends FetchPostAdState {
  final List<PostEntity> posts;
  FetchPostAdSuccess(this.posts);
}

final class FetchPostAdFailure extends FetchPostAdState {
  final String message;
  FetchPostAdFailure(this.message);
}
