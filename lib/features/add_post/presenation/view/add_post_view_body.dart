import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/theming/widgets/app_text_form_field.dart';
import '../../domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/widgets/app_text_button.dart';
import '../manager/cubit/add_post_cubit.dart';
import 'image_field.dart';

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String title, description, location, category, currency, subCategory;
  late int price;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              AppTextFormField(
                hintText: 'Title',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                onSaved: (value) {
                  title = value!;
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
                onSaved: (value) {
                  price = int.parse(value!);
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'Currency',

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                onSaved: (value) {
                  currency = value!;
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
                onSaved: (value) {
                  description = value!;
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
                onSaved: (value) {
                  location = value!;
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
                onSaved: (value) {
                  category = value!;
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              AppTextFormField(
                hintText: 'SubCategory',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                },
                onSaved: (value) {
                  subCategory = value!;
                },
                // controller: context.read<SignUpEmailCubit>().nameController,
              ),
              verticalSpace(18),
              ImageField(
                onImageSelected: (image) {
                  this.image = image;
                },
              ),
              verticalSpace(18),
              AppTextButton(
                buttonText: "Post Ad",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      PostEntity addPostEntity = PostEntity(
                        subCategory: subCategory,
                        title: title,
                        description: description,
                        location: location,
                        price: price,
                        category: category,
                        currency: currency,
                        image: image!,
                      );
                      context.read<AddPostCubit>().addPost(addPostEntity);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an image'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
