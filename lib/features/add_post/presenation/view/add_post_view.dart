// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/services/dependency_injection.dart';
// import '../../domain/repos/images_repo/images_repo.dart';
// import '../../domain/repos/posts_repo/post_repo.dart';
// import '../manager/cubit/add_post_cubit.dart';
// import 'add_post_view_body.dart';

// class AddPostView extends StatelessWidget {
//   const AddPostView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Post'),
//       ),
//       body: BlocProvider(
//         create: (context) => AddPostCubit(
//             getIt.get<ImagesRepo>(),
//             getIt.get<
//                 PostRepo>()), //getIt.get<PostRepo>() is the same as getIt<PostRepo>()
//         child: const AddPostViewBody(),
//       ),
//     );
//   }
// }
