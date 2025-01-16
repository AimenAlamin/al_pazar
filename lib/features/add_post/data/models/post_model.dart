import 'dart:io';

import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';

class PostModel {
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
  final String sellerId;
  final String sellerName;

  PostModel({
    required this.title,
    required this.location,
    required this.price,
    required this.currency,
    required this.timestamp,
    required this.sellerId,
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
//this is a factory constructor that takes a postEntity and returns a postModel, needed when we want to send the postEntity to the database
  factory PostModel.fromEntity(PostEntity postEntity) {
    return PostModel(
      title: postEntity.title,
      description: postEntity.description!,
      location: postEntity.location,
      price: postEntity.price,
      category: postEntity.category!,
      subCategory: postEntity.subCategory!,
      currency: postEntity.currency,
      image: postEntity.image,
      imageUrl: postEntity.imageUrl,
      timestamp: postEntity.timestamp,
      sellerId: postEntity.sellerId,
      sellerName: postEntity.sellerName,
      paymentOptions: postEntity.paymentOptions,
      contactMethod: postEntity.contactMethod,
      phoneNumber: postEntity.phoneNumber,
      condition: postEntity.condition,
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
      sellerId: json['sellerId'],
      sellerName: json['sellerName'],
      phoneNumber: json['phoneNumber'],
      condition: json['condition'],
      paymentOptions: (json['paymentOptions'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      contactMethod: (json['contactMethod'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),

      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e.toString()).toList(),

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
      'currency': currency,
      'category': category,
      'subCategory': subCategory,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'imageUrl': imageUrl,
      'paymentOptions': paymentOptions,
      'contactMethod': contactMethod,
      'phoneNumber': phoneNumber,
      'condition': condition,
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
      sellerId: sellerId,
      sellerName: sellerName,
      imageUrl: imageUrl,
      timestamp: timestamp,
      paymentOptions: paymentOptions,
      contactMethod: contactMethod,
      phoneNumber: phoneNumber,
      condition: condition,
    );
  }
}
