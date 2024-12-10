import 'dart:io';

class PostEntity {
  final String title;
  final String description;
  final String location;
  final int price;
  final String category;
  final String currency;
  final File image;
  final String? imageUrl;

  PostEntity(
      {required this.title,
      this.imageUrl,
      required this.description,
      required this.location,
      required this.price,
      required this.category,
      required this.currency,
      required this.image});
}
