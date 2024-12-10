import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotActive extends StatelessWidget {
  const NotActive({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
        ),
        verticalSpace(2),
        Text(text, style: TextStyles.font12DarkBlueRegular),
      ],
    );
  }
}
