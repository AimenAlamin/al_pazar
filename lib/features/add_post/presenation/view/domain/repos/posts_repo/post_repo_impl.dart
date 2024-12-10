import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/features/add_post/presenation/view/domain/entities/add_post_entity.dart';
import 'package:al_pazar/features/add_post/presenation/view/domain/repos/posts_repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImpl implements PostRepo {
  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
