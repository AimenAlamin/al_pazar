import 'dart:io';

import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:al_pazar/core/theming/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/widgets/app_text_button.dart';
import 'image_field.dart';

class AddPostViewBody extends StatefulWidget {
//  List<File> image_post = [];
  AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  File? imagedisplay;
  List<File> image_post = [];
  void displayImage({required File imageTaken, required int index}) {
    setState(() {
      imagedisplay = imageTaken;
      if (index != Null) {
        image_post.add(imagedisplay!);
      } else {
        image_post[index] = imageTaken;
      }
      print(' this  the index : $index and the file: $imageTaken ');
    });
    //  print(image_post);
  }

  late String title, description, location, category;
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
              //user upload image  section
              Text("You'r are almost there"),
              Text(
                "Include as much details and picture as possible and set the right price",
                textAlign: TextAlign.center,
              ),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    // border: Border.all(color: ColorsManager.mainBlue)
                    ),
                child: Row(
                  //  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: ImageField(
                            index: 0,
                            displayImage: displayImage,
                            onImageSelected: (image) {
                              this.image = image;
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => ImageField(
                            displayImage: displayImage,
                            index: 1,
                            onImageSelected: (image) {
                              this.image = image;
                            },
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 75,
                              width: 75,
                              color: ColorsManager.darkBlue,
                              child: image_post.isNotEmpty
                                  ? Image.file(
                                      image_post[0],
                                      fit: BoxFit.cover,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 75,
                            width: 75,
                            color: ColorsManager.darkBlue,
                            child: image_post.isNotEmpty
                                ? Image.file(
                                    image_post[0],
                                    fit: BoxFit.cover,
                                  )
                                : SizedBox(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              verticalSpace(18),

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
              // ImageField(
              //   onImageSelected: (image) {
              //     this.image = image;
              //   },
              //   displayImage: displayImage,
              // ),
              verticalSpace(18),
              AppTextButton(
                buttonText: "Post Ad",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
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
