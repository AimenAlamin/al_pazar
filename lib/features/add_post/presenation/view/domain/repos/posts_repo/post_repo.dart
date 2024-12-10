import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/features/add_post/presenation/view/domain/entities/add_post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  //Future<Either<Failure, AddPostEntity>> addPost(Post post);
}
