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
  List<String>? paymentOptions;
  List<String>? contactMethod;
  String? phoneNumber;
  String? condition;
  final DateTime timestamp;
  final String userId;
  final String sellerName;

  PostEntity({
    required this.title,
    required this.location,
    required this.price,
    required this.currency,
    required this.timestamp,
    required this.userId,
    required this.sellerName,
    this.description,
    this.category,
    this.subCategory,
    this.image,
    this.imageUrl,
    this.paymentOptions,
    this.contactMethod,
    this.phoneNumber,
    this.condition,
  });
}
