import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/helpers/spacing.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../add_post/domain/entities/post_entity.dart';

class CustomPostDetialsNavbar extends StatelessWidget {
  const CustomPostDetialsNavbar({
    super.key,
    required this.postDetails,
  });

  final PostEntity postDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightRead, // Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      padding: EdgeInsets.all(25.r),
      child: Row(
        children: [
          // Profile picture of seller
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.mediumRed,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_2_outlined),
            ),
          ),
          horizontalSpace(5),
          Text(
            postDetails.sellerName, // Use category-specific name
            style: TextStyles.font14DarkBlueMedium,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.mediumRed,
              shape: BoxShape.circle,
            ),

            //kibzar chat button
            child: IconButton(
              onPressed: () {
                context.pushNamed(Routes.chatScreen, arguments: postDetails);
              },
              icon: const Icon(Icons.message_outlined),
            ),
          ),
          //phone call button

          Container(
            decoration: const BoxDecoration(
              color: ColorsManager.mediumRed,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () async {
                final String phoneNumber = postDetails.phoneNumber!;
                final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

                try {
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(
                      phoneUri,
                      mode: LaunchMode
                          .externalApplication, // Opens phone dialer externally
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch phone dialer')),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to open phone dialer: $e')),
                  );
                }
              },
              icon: const Icon(Icons.phone_outlined),
            ),
          ),

          // WhatsApp button
          GestureDetector(
            onTap: () async {
              final String phone = postDetails.phoneNumber!.replaceAll('+', '');
              const String text = "Hello, I'm interested in your ad";
              final String androidUrl =
                  "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(text)}";

              try {
                await launchUrl(Uri.parse(androidUrl),
                    mode: LaunchMode.externalApplication);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to open WhatsApp: $e')),
                );
              }
            },
            child: CircleAvatar(
              radius: 28,
              backgroundColor: ColorsManager.lightRead,
              child: SvgPicture.asset(
                'assets/svgs/whatsapp-brands-solid.svg', // Use category-specific icon
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
