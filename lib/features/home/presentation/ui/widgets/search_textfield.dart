import 'package:al_pazar/core/theming/widgets/app_text_form_field.dart';

import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextFormField(
      hintText: "What are you looking for ?",
      suffixIcon: Icon(Icons.search),
    );
  }
}
