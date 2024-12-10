import '../colors.dart';
import 'package:flutter/material.dart';

loadingWidget(context) => showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),
      ),
    );
