import 'dart:io';

import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';

class PostModel {
  final String title;
  final String description;
  final String location;
  final int price;
  final String category;
  final String subCategory;
  final String currency;
  final File image;
  String? imageUrl;

  PostModel(
      {required this.title,
      this.imageUrl,
      required this.description,
      required this.location,
      required this.price,
      required this.category,
      required this.currency,
      required this.subCategory,
      required this.image});

  factory PostModel.fromEntity(PostEntity postEntity) {
    return PostModel(
      title: postEntity.title,
      description: postEntity.description,
      location: postEntity.location,
      price: postEntity.price,
      category: postEntity.category,
      subCategory: postEntity.subCategory,
      currency: postEntity.currency,
      image: postEntity.image,
      imageUrl: postEntity.imageUrl,
    );
  }
  toJson() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'category': category,
      'currency': currency,
      'subCategory': subCategory,
      'imageUrl': imageUrl,
    };
  }
}
