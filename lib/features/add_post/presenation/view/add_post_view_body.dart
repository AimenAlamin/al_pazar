import 'package:al_pazar/core/theming/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'image_field.dart';

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              AppTextFormField(
                hintText: 'Title',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'Price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'Description',
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'Location',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'Category',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              ImageField(),
            ],
          ),
        ),
      ),
    );
  }
}
