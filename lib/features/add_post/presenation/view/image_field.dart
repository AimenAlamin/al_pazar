import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImagesSelected});
  final ValueChanged<List<File>>
      onImagesSelected; // Accept a list of images instead of a single image

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  List<File> fileImages = []; // Store multiple images

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Display all selected images horizontally
              ...fileImages.map((image) => Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0.r),
                          child: Image.file(
                            image,
                            width: 100.r,
                            height: 100.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20.r,
                            ),
                            onPressed: () {
                              setState(() {
                                fileImages.remove(
                                    image); // Remove image from the list
                                widget.onImagesSelected(fileImages);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
              // Add button to pick more images
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0.r),
                  border: Border.all(
                    color: const Color.fromARGB(255, 203, 182, 182),
                    width: 1.0.r,
                  ),
                ),
                child: IconButton(
                  onPressed: () async {
                    await pickImages();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.add,
                    size: 50.r,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Modified to allow selecting multiple images
  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images =
        await picker.pickMultiImage(); // Pick multiple images

    if (images != null) {
      setState(() {
        fileImages.addAll(images.map((image) =>
            File(image.path))); // Add all selected images to the list
        widget.onImagesSelected(
            fileImages); // Pass the list of images to the parent
      });
    }
  }
}
