import 'package:al_pazar/core/services/data_serivce.dart';
import 'package:al_pazar/features/add_post/domain/entities/add_post_entity.dart';

import '../../../../../core/errors/failure.dart';

import 'post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImpl implements PostRepo {
  final DatabaseService databaseService;

  PostRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addPosts(PostEntity postEntity) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }
}
