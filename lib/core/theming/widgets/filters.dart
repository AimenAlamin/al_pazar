import '../../helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../routing/routes.dart';
import '../colors.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.homeScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: ColorsManager.moreLighterGray,
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset("assets/svgs/filters.svg"),
      ),
    );
  }
}
