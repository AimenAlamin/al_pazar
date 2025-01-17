import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';

import '../../../../../core/errors/failure.dart';

import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<Failure, void>> addPosts(PostEntity postEntity);
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, List<PostEntity>>> getFilteredPosts(
    String categoryName,
  );
  Future<Either<Failure, List<PostEntity>>> getSubCategoryFilteredPosts(
    String subCategoryName,
  );
}
