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

// ADD THIS import:
import 'package:intl_phone_field/intl_phone_field.dart';

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

  // Removed _phoneNumberController since we'll be using IntlPhoneField

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // No more _phoneNumberController to dispose
    super.dispose();
  }

  void _showCurrencyBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: currencies.map((currency) {
            return ListTile(
              leading:
                  Text(currency['flag'], style: const TextStyle(fontSize: 24)),
              title: Text(currency['name']),
              onTap: () {
                setState(() {
                  // set the text field's value
                  this.currency = currency['name'];
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
                  location = city;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showPaymentOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: paymentOptionsList.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: paymentOptions.contains(option),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    paymentOptions.add(option);
                  } else {
                    paymentOptions.remove(option);
                  }
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showConditionBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: ['New', 'Used', 'Other'].map((cond) {
            return ListTile(
              title: Text(cond),
              onTap: () {
                setState(() {
                  condition = cond;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showContactMethodsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: contactMethodsList.map((method) {
            return CheckboxListTile(
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
                        return null;
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
                        return null;
                      },
                      onSaved: (value) {
                        price = int.parse(value!);
                      },
                    ),
                    verticalSpace(18),
                    // Currency selection
                    GestureDetector(
                      onTap: _showCurrencyBottomSheet,
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          hintText: 'Currency',
                          validator: (value) {
                            if (currency.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // We'll store the selected currency from the state
                          },
                          controller: TextEditingController(text: currency),
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
                        return null;
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
                          hintText: 'Location',
                          validator: (value) {
                            if (location.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // We'll store the selected location from the state
                          },
                          controller: TextEditingController(text: location),
                        ),
                      ),
                    ),
                    verticalSpace(18),

                    // REPLACED PHONE NUMBER FIELD WITH IntlPhoneField
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Mobile Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'US',
                      onChanged: (phone) {
                        // This fires every time the user changes the input
                        // You can store partial changes if you want:
                        phoneNumber = phone.completeNumber;
                      },
                      validator: (phone) {
                        if (phone == null || phone.number.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      onSaved: (phone) {
                        // This fires when the form is saved (submit):
                        phoneNumber =
                            phone!.completeNumber; // e.g. +905338567220
                      },
                    ),

                    verticalSpace(18),
                    GestureDetector(
                      onTap: _showPaymentOptionsBottomSheet,
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          hintText: 'Payment Options',
                          validator: (value) {
                            if (paymentOptions.isEmpty) {
                              return 'Please select at least one payment option';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    GestureDetector(
                      onTap: _showConditionBottomSheet,
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          hintText: 'Condition',
                          controller: TextEditingController(text: condition),
                          validator: (value) {
                            if (condition.isEmpty) {
                              return 'Please select a condition';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    GestureDetector(
                      onTap: _showContactMethodsBottomSheet,
                      child: AbsorbPointer(
                        child: AppTextFormField(
                          hintText: 'Contact Methods',
                          validator: (value) {
                            if (contactMethods.isEmpty) {
                              return 'Please select at least one contact method';
                            }
                            return null;
                          },
                          controller: TextEditingController(
                            text: contactMethods.join(', '),
                          ),
                        ),
                      ),
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
                              phoneNumber: phoneNumber, // e.g. +905338567220
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
