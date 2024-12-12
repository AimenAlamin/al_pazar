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
  File? image;
  String? imageUrl;
  final DateTime timestamp;

  PostModel(
      {required this.title,
      this.imageUrl,
      required this.description,
      required this.location,
      required this.price,
      required this.category,
      required this.currency,
      required this.subCategory,
      required this.timestamp,
      this.image});
//this is a factory constructor that takes a postEntity and returns a postModel, needed when we want to send the postEntity to the database
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
      timestamp: postEntity.timestamp,
    );
  }
//this is a factory constructor that takes a map of strings and dynamic and returns a postModel, needed when we want to get the postModel from the database
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      description: json['description'],
      location: json['location'],
      price: json['price'],
      category: json['category'],
      subCategory: json['subCategory'],
      currency: json['currency'],
      imageUrl: json['imageUrl'],
      timestamp: DateTime.parse(json[
          'timestamp']), //converting the timestamp from a string to a DateTime object
    );
  }
  //this method is used to convert the postModel to a map of strings and dynamic, needed when we want to send the postModel to the database
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
      'timestamp':
          timestamp.toIso8601String(), //converting the timestamp to a string
    };
  }

  // this method is used to convert the postModel to a postEntity, needed when we want to retrieve the data from the database and display it in the UI
  PostEntity toEntity() {
    return PostEntity(
      title: title,
      description: description,
      location: location,
      price: price,
      category: category,
      currency: currency,
      subCategory: subCategory,
      imageUrl: imageUrl,
      timestamp: timestamp,
    );
  }
}
