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

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      var postData = await databaseService.getData(
          //type casting because I know I will receive a list of maps of strings and dynamic
          path: BackEndpoint.postsCollection) as List<Map<String, dynamic>>;
      //
      //1st way. detialed
      //mapping each item in the collection and then parse it to a list of postModels
      // List<PostModel> postModels =
      //     postData.map((item) => PostModel.fromJson(item)).toList();
      // //mapping each item in the list of postModels and then parse it to a list of postEntities because the method should return a list of postEntities
      // List<PostEntity> postEntities =
      //     postData.map((e) => e.toEntity()).toList();
      // return Right(postEntities);
      //
      //2nd way. shortcut
      List<PostEntity> posts =
          postData.map((e) => PostModel.fromJson(e).toEntity()).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to get posts"));
    }
  }
}
