import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/styles.dart';

class CategoriesSeeAll extends StatelessWidget {
  const CategoriesSeeAll({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.collectionAllList);
          },
          child: Text(
            'See All',
            style: TextStyles.font12DarkBlueBold,
          ),
        ),
      ],
    );
  }
}
