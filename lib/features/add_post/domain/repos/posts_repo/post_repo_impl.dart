import 'package:al_pazar/features/add_post/domain/entities/add_post_entity.dart';

import '../../../../../core/errors/failure.dart';

import 'post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImpl implements PostRepo {
  @override
  Future<Either<Failure, void>> addPosts(PostEntity postEntity) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }
}
