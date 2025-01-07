import 'dart:io';

import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/theming/widgets/app_text_form_field.dart';
import '../../domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/widgets/app_text_button.dart';
import '../manager/cubit/add_post_cubit.dart';
import 'add_post_listener.dart';
import 'image_field.dart';

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({
    super.key,
    required this.selectedCategory,
    required this.selectedSubcategory,
  });

  final String selectedCategory;
  final String selectedSubcategory;

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String title, description, currency = '', location = '';
  late int price;
  List<File>? image;

  final List<Map<String, dynamic>> currencies = [
    {'name': 'TL', 'flag': '🇹🇷'},
    {'name': 'USD', 'flag': '🇺🇸'},
    {'name': 'EUR', 'flag': '🇪🇺'},
    {'name': 'GBP', 'flag': '🇬🇧'},
  ];

  final List<String> northCyprusCities = [
    "Lefkoşa",
    "Mağusa",
    "Girne",
    "Güzelyurt",
    "İskele",
    "Lefke"
  ];

  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _currencyController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _showCurrencyBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: currencies.map((currency) {
            return ListTile(
              leading: Text(currency['flag'], style: TextStyle(fontSize: 24)),
              title: Text(currency['name']),
              onTap: () {
                setState(() {
                  _currencyController.text = currency['name'];
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showLocationBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: northCyprusCities.map((city) {
            return ListTile(
              title: Text(city),
              onTap: () {
                setState(() {
                  _locationController.text = city;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place an ad'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(5),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.selectedCategory,
                      style: TextStyles.font13BlueSemiBold,
                    ),
                    TextSpan(
                      text: ' >  ',
                      style: TextStyles.font13DarkBlueRegular,
                    ),
                    TextSpan(
                      text: widget.selectedSubcategory,
                      style: TextStyles.font13DarkBlueRegular,
                    ),
                  ],
                ),
              ),
              verticalSpace(18),
              const AddPostListener(),
              Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    ImageField(
                      onImagesSelected: (images) {
                        image = images;
                      },
                    ),
                    // ImageField(
                    //   onImageSelected: (image) {
                    //     this.image = image;
                    //   },
                    // ),
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
                    ),
                    verticalSpace(18),
                    GestureDetector(
                      onTap: _showCurrencyBottomSheet,
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          controller: _currencyController,
                          hintText: 'Currency',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          onSaved: (value) {
                            currency = value!;
                          },
                        ),
                      ),
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
                    ),
                    verticalSpace(18),
                    GestureDetector(
                      onTap: _showLocationBottomSheet,
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          controller: _locationController,
                          hintText: 'Location',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          onSaved: (value) {
                            location = value!;
                          },
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    verticalSpace(18),
                    AppTextButton(
                      buttonText: "Post Ad",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        if (image != null) {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            PostEntity addPostEntity = PostEntity(
                              subCategory: widget.selectedSubcategory,
                              title: title,
                              description: description,
                              location: location,
                              price: price,
                              category: widget.selectedCategory,
                              currency: currency,
                              sellerId: getUserSavedData().uId,
                              sellerName: getUserSavedData().name,
                              image: image!,
                              timestamp: DateTime.now(),
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
            ],
          ),
        ),
      ),
    );
  }
}
