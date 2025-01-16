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
  late String condition = 'New'; // Default condition
  late String phoneNumber;
  List<String> paymentOptions = [];
  List<String> contactMethods = [];
  List<File>? image;

  final List<Map<String, dynamic>> currencies = [
    {'name': 'TRY', 'flag': '🇹🇷'},
    {'name': 'USD', 'flag': '🇺🇸'},
    {'name': 'EUR', 'flag': '🇪🇺'},
    {'name': 'GBP', 'flag': '🇬🇧'},
  ];

  final List<String> paymentOptionsList = ['Cash', 'Exchange', 'Installment'];
  final List<String> contactMethodsList = [
    'Phone Number',
    'Kibzar Chat',
    'Both'
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
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _currencyController.dispose();
    _locationController.dispose();
    _phoneNumberController.dispose();
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

                    // Phone Number Field
                    AppTextFormField(
                      controller: _phoneNumberController,
                      hintText: 'Mobile Phone Number',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      onSaved: (value) {
                        phoneNumber = value!;
                      },
                    ),
                    verticalSpace(18),

                    // Payment Options Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Payment Options',
                            style: TextStyles.font12DarkBlueBold),
                        verticalSpace(8),
                        Row(
                          children: paymentOptionsList.map((option) {
                            return Flexible(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                title: Text(option,
                                    style: TextStyles.font12DarkBlueMedium),
                                value: paymentOptions.contains(option),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      paymentOptions.add(option);
                                    } else {
                                      paymentOptions.remove(option);
                                    }
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                    verticalSpace(18),

                    // Condition Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Condition', style: TextStyles.font12DarkBlueBold),
                        verticalSpace(8),
                        Row(
                          children: ['New', 'Used', 'Other'].map((cond) {
                            return Expanded(
                              child: RadioListTile<String>(
                                contentPadding: EdgeInsets.zero,
                                title: Text(cond),
                                value: cond,
                                groupValue: condition,
                                onChanged: (value) {
                                  setState(() {
                                    condition = value!;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    verticalSpace(18),

                    // Contact Methods Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact Method',
                            style: TextStyles.font12DarkBlueBold),
                        verticalSpace(8),
                        Row(
                          children: contactMethodsList.map((method) {
                            return Expanded(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                title: Text(method),
                                value: contactMethods.contains(method),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      contactMethods.add(method);
                                    } else {
                                      contactMethods.remove(method);
                                    }
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
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
                              subCategory: widget.selectedSubcategory,
                              title: title,
                              description: description,
                              location: location,
                              price: price,
                              category: widget.selectedCategory,
                              currency: currency,
                              userId: getUserSavedData().uId,
                              sellerName: getUserSavedData().name,
                              image: image!,
                              timestamp: DateTime.now(),
                              condition: condition,
                              phoneNumber: phoneNumber,
                              paymentOptions: paymentOptions,
                              contactMethod: contactMethods,
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
