import 'dart:io';

class PostEntity {
  final String title;
  final String description;
  final String location;
  final int price;
  final String category;
  final String subCategory;
  final String currency;
  File? image;
  String? imageUrl;
  // List<<CategoryEntity> categories;

  PostEntity(
      {required this.title,
      this.imageUrl,
      required this.description,
      required this.location,
      required this.price,
      required this.category,
      required this.subCategory,
      required this.currency,
      this.image});
}
