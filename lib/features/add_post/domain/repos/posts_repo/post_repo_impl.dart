import 'package:al_pazar/core/helpers/endpoints.dart';
import 'package:al_pazar/core/services/data_serivce.dart';
import 'package:al_pazar/features/add_post/data/models/post_model.dart';
import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      // Prepare the filter for Firestore

      // Call Firestore's getData method with the filter
      var getpostData = await databaseService.getData(
        path: BackEndpoint.postsCollection,
        query: {
          'limit': 10,
          "orderBy": "timestamp",
          "descending": true,
        },
      ) as List<Map<String, dynamic>>;

      // Map the result to PostEntity
      List<PostEntity> posts =
          getpostData.map((e) => PostModel.fromJson(e).toEntity()).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to get posts"));
    }
  }

  //here we get the posts based on the category
  @override
  Future<Either<Failure, List<PostEntity>>> getFilteredPosts(
      String categoryName) async {
    try {
      // Prepare the filter for Firestore

      // Call Firestore's getData method with the filter
      var getpostData = await databaseService.getData(
        path: BackEndpoint.postsCollection,
        query: {
          'category': categoryName,
        },
      ) as List<Map<String, dynamic>>;

      // Map the result to PostEntity
      List<PostEntity> posts =
          getpostData.map((e) => PostModel.fromJson(e).toEntity()).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to get posts"));
    }
  }

  //here we get the posts based on the subcategory
  @override
  @override
  Future<Either<Failure, List<PostEntity>>> getSubCategoryFilteredPosts(
      String subCategoryName) async {
    try {
      // Prepare the filter for Firestore

      // Call Firestore's getData method with the filter
      var getpostData = await databaseService.getData(
        path: BackEndpoint.postsCollection,
        query: {
          'subCategory': subCategoryName,
        },
      ) as List<Map<String, dynamic>>;

      // Map the result to PostEntity
      List<PostEntity> posts =
          getpostData.map((e) => PostModel.fromJson(e).toEntity()).toList();

      return Right(posts);
    } catch (e) {
      return Left(ServerFailure("Failed to get posts"));
    }
  }
}

extension on FirebaseFirestore {
  addPostWithDocRef(
      {required String path, required Map<String, dynamic> data}) {}
}
