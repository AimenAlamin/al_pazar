import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key, required this.text});
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
