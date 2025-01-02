import 'dart:io';

class PostEntity {
  final String title;
  String? description;
  final String location;
  final int price;
  String? category;
  String? subCategory;
  final String currency;
  List<File>? image;
  List<String>? imageUrl;
  final DateTime timestamp;

  PostEntity(
      {required this.title,
      required this.location,
      required this.price,
      required this.currency,
      required this.timestamp,
      this.description,
      this.category,
      this.subCategory,
      this.image,
      this.imageUrl});
}
