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
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add post"));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      // Fetch posts with document IDs
      List<Map<String, dynamic>> rawPostData =
          await databaseService.getDataWithIds(
        path: BackEndpoint.postsCollection,
        query: {
          'orderBy': 'timestamp',
          'limit': 10,
          'descending': true,
        },
      );

      // Map raw data to PostEntity
      List<PostEntity> posts = rawPostData.map((data) {
        final String postId = data['postId']; // Extract the document ID
        return PostModel.fromJson(data, postId).toEntity();
      }).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to fetch posts: $e"));
    }
  }

  // Filter by 'category' only
  @override
  Future<Either<Failure, List<PostEntity>>> getFilteredPosts(
    String categoryName,
  ) async {
    try {
      // Fetch from Firestore
      var getpostData = await databaseService.getDataWithIds(
        path: BackEndpoint.postsCollection,
        query: {
          'category': categoryName,
        },
      );

      // Map the result to PostEntity
      List<PostEntity> posts = getpostData.map((data) {
        final String postId = data['postId']; // Extract the document ID
        return PostModel.fromJson(data, postId).toEntity();
      }).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to get posts: $e"));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getSubCategoryFilteredPosts(
    String subCategoryName,
  ) async {
    try {
      // Fetch from Firestore
      var getpostData = await databaseService.getDataWithIds(
        path: BackEndpoint.postsCollection,
        query: {
          'subCategory': subCategoryName,
        },
      );

      // Map the result to PostEntity
      List<PostEntity> posts = getpostData.map((data) {
        final String postId = data['postId']; // Extract the document ID
        return PostModel.fromJson(data, postId).toEntity();
      }).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to get posts: $e"));
    }
  }
}
