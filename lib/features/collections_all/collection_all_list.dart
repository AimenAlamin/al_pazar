import 'package:flutter/material.dart';

import '../../core/theming/widgets/custom_app_bar.dart';

class CollectionAllList extends StatelessWidget {
  const CollectionAllList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Cars"),
      body: const Center(child: Text("data")),
    );
  }
}
