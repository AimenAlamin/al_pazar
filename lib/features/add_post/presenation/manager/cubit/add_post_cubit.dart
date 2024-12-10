import 'package:al_pazar/features/add_post/domain/entities/add_post_entity.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/repos/images_repo/images_repo.dart';
import '../../../domain/repos/posts_repo/post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this.imagesRepo, this.postRepo) : super(AddPostInitial());
  final ImagesRepo imagesRepo;
  final PostRepo postRepo;

//method triggered when the user clicks the post sumbit button
  Future<void> addPost(PostEntity postEntity) async {
    emit(AddPostLoading());
    var result = await imagesRepo.uploadImage(
        postEntity.image); // 1st uploading the image to the storage
    result.fold((failure) {
      emit(
        AddPostFailure(failure.message),
      );
    }, (url) async {
      postEntity.imageUrl =
          url; //2nd retrieving the image url after successful upload
      var finalresult = await postRepo.addPosts(
          postEntity); //3rd adding all the post entity to the database(firestore)
      finalresult.fold((failure) {
        emit(
          AddPostFailure(failure.message),
        );
      }, (success) {
        emit(
          AddPostSuccess(),
        );
      });
    });
  }
}
