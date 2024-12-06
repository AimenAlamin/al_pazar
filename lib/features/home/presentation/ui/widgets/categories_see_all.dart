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
        Text(
          'See All',
          style: TextStyles.font12DarkBlueBold,
        ),
      ],
    );
  }
}
