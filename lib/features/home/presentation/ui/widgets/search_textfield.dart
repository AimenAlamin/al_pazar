import 'package:flutter/material.dart';

import '../../../../../core/theming/widgets/app_text_form_field.dart';

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
