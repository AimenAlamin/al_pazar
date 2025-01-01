import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> images = [
    'assets/images/henry-co-21HT36zwLn8-unsplash.jpg',
    'assets/images/florencia-viadana-0y92si4ZLyA-unsplash.jpg',
    'assets/images/toa-heftiba-50ijCEHhN8o-unsplash.jpg',
  ];

  late PageController _pageController;
  int _currentIndex = 1; // Start from 1 to match the duplicated list
  Timer? _timer;

  List<String> get _loopedImages {
    // Add first and last images to create a seamless loop
    return [images.last, ...images, images.first];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_pageController.hasClients) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );

        if (_currentIndex == _loopedImages.length - 1) {
          // Reset to the second page (first real image) after animation
          Future.delayed(const Duration(milliseconds: 300), () {
            if (_pageController.hasClients) {
              _pageController.jumpToPage(1);
              _currentIndex = 1;
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _loopedImages.length,
      itemBuilder: (context, index) {
        return Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r), // Rounded corners
            child: Image.asset(
              _loopedImages[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      },
      onPageChanged: (index) {
        // Update index to handle edge transitions
        _currentIndex = index;
        if (index == 0) {
          _pageController.jumpToPage(_loopedImages.length - 2);
        } else if (index == _loopedImages.length - 1) {
          _pageController.jumpToPage(1);
        }
      },
    );
  }
}
