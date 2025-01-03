import 'package:al_pazar/core/helpers/extensions.dart';

import 'package:flutter/material.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/widgets/app_text_form_field.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return AppTextFormField(
        hintText: "What are you looking for ?",
        suffixIcon: const Icon(Icons.search),
        controller: searchController,
        onFieldSubmitted: (value) {
          context.pushNamed(Routes.subCategoryFilterView, arguments: value);
        });
  }
}
