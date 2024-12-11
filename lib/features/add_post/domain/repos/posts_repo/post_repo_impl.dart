import 'package:al_pazar/core/helpers/endpoints.dart';
import 'package:al_pazar/core/services/data_serivce.dart';
import 'package:al_pazar/features/add_post/data/models/post_model.dart';
import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';

import '../../../../../core/errors/failure.dart';

import 'post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImpl implements PostRepo {
  final DatabaseService databaseService;

  PostRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addPosts(PostEntity postEntity) async {
    //here we mention where to store the postEntity (the post detials)
    try {
      await databaseService.addData(
          path: BackEndpoint.postsCollection,
          data: PostModel.fromEntity(postEntity).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add post"));
    }
  }
}
