import 'package:al_pazar/core/theming/colors.dart';
import 'package:flutter/material.dart';

loadingWidget(context) => showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),
      ),
    );
