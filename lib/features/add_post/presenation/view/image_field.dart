// import 'dart:io';
import 'dart:io';

import 'package:al_pazar/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  int index;
  void Function({required File imageTaken, required int index}) displayImage;

  ImageField(
      {super.key,
      required this.displayImage,
      required this.index,
      required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? fileImage;
  bool isLoaded = false;
  int tracked = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showImagePickerOptions(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0.r),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12.0.r),
              ),
              child:
                  //fileImage != null
                  //   ? Image.file(
                  //       fileImage!,
                  //       width: 50,
                  //       height: 50,
                  //    )
                  //:
                  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: ColorsManager.darkBlue,
                      size: 20.r,
                    ),
                    Text("Add image"),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: fileImage != null,
            child: IconButton(
              onPressed: () {
                fileImage = null;
                widget.onImageSelected(null);
                setState(() {});
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Function to show modal bottom sheet with options
  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Upload from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  pick_image(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  pick_image(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Function to pick an image from the specified source
  Future<void> pick_image(ImageSource source) async {
    setState(() => isLoaded = true);

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        fileImage = File(image.path);
        widget.onImageSelected(fileImage);
        widget.displayImage(imageTaken: fileImage!, index: widget.index);
        // image_post.add(fileImage!);
        // print(image_post);
      }
    } catch (e) {
      // Handle any errors if necessary
    } finally {
      setState(() => isLoaded = false);
    }
  }
}
