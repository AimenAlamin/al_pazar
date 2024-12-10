import 'package:al_pazar/features/add_post/domain/entities/add_post_entity.dart';

import '../../../../../core/errors/failure.dart';

import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<Failure, void>> addPosts(PostEntity postEntity);
  //Future<Either<Failure, AddPostEntity>> addPost(Post post);
}
