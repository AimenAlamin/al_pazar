import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? fileImage;
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoaded,
      child: GestureDetector(
        onTap: () async {
          isLoaded = true;
          setState(() {});
          try {
            await pick_image();
          } catch (e) {
            isLoaded = false;
            setState(() {});
          }
          isLoaded = false;
          setState(() {});
        },
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
                child: fileImage != null
                    ? Image.file(
                        fileImage!,
                      )
                    : Icon(
                        Icons.image_outlined,
                        size: 100.r,
                      ),
                // child: Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(
                //       color: Colors.grey,
                //     ),
                //   ),
                //   width: double.infinity,
                // child: fileImage != null
                //     ? Image.file(fileImage!)
                //     : Icon(
                //         Icons.image_outlined,
                //           size: 100.r,
                //         ),
                // ),
              ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  fileImage = null;
                  widget.onImageSelected(fileImage);
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
      ),
    );
  }

  Future<void> pick_image() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    widget.onImageSelected(fileImage!);
  }
}
