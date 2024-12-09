import 'package:flutter/material.dart';

import 'add_post_view_body.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: AddPostViewBody(),
    );
  }
}
