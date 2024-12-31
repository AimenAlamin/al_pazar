import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //  // getUserSavedData().name,
            //   // 'Kibzar',
            //   style: TextStyles.font18DarkBlueBold,
            // ),
            // Text(
            //   ' ',
            //   style: TextStyles.font14GrayRegular,
            // ),
            SizedBox(
              height: 70.0,
              width: 70.0,
              child: Image.asset("assets/images/splashImg.png"),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(
            'assets/svgs/notification.svg',
          ),
        )
      ],
    );
  }
}
