import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/chatroom_entity.dart';

/// A model class representing a chatroom in Firestore.
/// This model is used to convert between Firestore data and `ChatRoomEntity`.
class ChatRoomModel {
  /// Unique identifier for the chatroom, usually formatted as "{postID}_{sellerID}_{buyerID}".
  final String chatRoomID;

  /// The ID of the post that initiated this chatroom.
  final String postID;

  /// The user ID of the buyer in this chatroom.
  final String buyerID;

  /// The user ID of the seller in this chatroom.
  final String sellerID;

  /// The title of the post being discussed.
  final String postTitle;

  /// The URL of the post’s main image for chat list previews.
  final String postPhotoUrl;

  /// The last message sent in the chatroom.
  final String lastMessage;

  /// Timestamp of the last message sent.
  final DateTime lastMessageTime;

  /// The name of the recipient, used to display in the UI.
  final String recipientName;

  /// Tracks the number of unread messages for each participant.
  final Map<String, int> unreadCount;

  final String price;
  final String currency;

  /// Constructor to initialize a `ChatRoomModel` with required fields.
  ChatRoomModel({
    required this.chatRoomID,
    required this.postID,
    required this.buyerID,
    required this.sellerID,
    required this.postTitle,
    required this.postPhotoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.recipientName,
    required this.unreadCount,
    required this.price,
    required this.currency,
  });

  /// Converts a `ChatRoomEntity` into a `ChatRoomModel`.
  /// Used when sending chatroom data to Firestore.
  factory ChatRoomModel.fromEntity(ChatRoomEntity chatroomEntity) {
    return ChatRoomModel(
      chatRoomID: chatroomEntity.chatRoomID!,
      postID: chatroomEntity.postID!,
      buyerID: chatroomEntity.buyerID!,
      sellerID: chatroomEntity.sellerID!,
      postTitle: chatroomEntity.postTitle!,
      postPhotoUrl: chatroomEntity.postPhotoUrl!,
      lastMessage: chatroomEntity.lastMessage!,
      lastMessageTime: chatroomEntity.lastMessageTime!,
      recipientName: chatroomEntity.recipientName!,
      unreadCount: chatroomEntity.unreadCount,
      price: chatroomEntity.price!,
      currency: chatroomEntity.currency!,
    );
  }

  /// Converts Firestore JSON data into a `ChatRoomModel`.
  /// Used when fetching chatroom data from Firestore.
  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      chatRoomID: json['chatRoomID'],
      postID: json['postID'],
      buyerID: json['buyerID'],
      sellerID: json['sellerID'],
      postTitle: json['postTitle'],
      postPhotoUrl: json['postPhotoUrl'],
      lastMessage: json['lastMessage'],
      lastMessageTime: (json['lastMessageTime'] as Timestamp).toDate(),
      recipientName: json['recipientName'],
      unreadCount: Map<String, int>.from(json['unreadCount'] ?? {}),
      price: json['price'],
      currency: json['currency'],
    );
  }

  /// Converts the `ChatRoomModel` into a Firestore-compatible JSON object.
  /// Used when saving chatroom data to Firestore.
  Map<String, dynamic> toJson() {
    return {
      'chatRoomID': chatRoomID,
      'postID': postID,
      'buyerID': buyerID,
      'sellerID': sellerID,
      'postTitle': postTitle,
      'postPhotoUrl': postPhotoUrl,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'recipientName': recipientName,
      'unreadCount': unreadCount,
      'price': price,
      'currency': currency,
    };
  }

  /// Converts the `ChatRoomModel` into a `ChatRoomEntity`.
  /// Used when retrieving chatroom data from Firestore and displaying it in the UI.
  ChatRoomEntity toEntity() {
    return ChatRoomEntity(
      chatRoomID: chatRoomID,
      postID: postID,
      buyerID: buyerID,
      sellerID: sellerID,
      postTitle: postTitle,
      postPhotoUrl: postPhotoUrl,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      recipientName: recipientName,
      unreadCount: unreadCount,
      price: price,
      currency: currency,
    );
  }
}
