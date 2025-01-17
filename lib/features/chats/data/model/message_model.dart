import 'dart:developer';

import 'package:al_pazar/core/helpers/encryption.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String? conversationId;
  final String? userId;
  final String? recipientId;
  final String? postId;
  String? message;
  final DateTime? timestamp;
  final bool? isRead;

  MessageModel({
    this.conversationId,
    this.userId,
    this.recipientId,
    this.postId,
    this.message,
    this.timestamp,
    this.isRead,
  });

  factory MessageModel.fromEntity(MessageEntity messageEntity) {
    return MessageModel(
      conversationId: messageEntity.conversationId,
      userId: messageEntity.userId,
      recipientId: messageEntity.recipientId,
      postId: messageEntity.postId,
      message: messageEntity.message,
      timestamp: messageEntity.timestamp,
      isRead: messageEntity.isRead,
    );
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    String? rawMessage = json['message'];

    // If the stored message looks like a CryptoJS-based ciphertext, decrypt it
    if (rawMessage != null && rawMessage.startsWith('U2FsdGVkX1')) {
      try {
        rawMessage = CryptoJSHelper.decryptFromBase64(rawMessage);
      } catch (e) {
        log('Failed to decrypt message: $e');
        // Fallback: keep rawMessage as-is or handle accordingly
      }
    }

    return MessageModel(
      conversationId: json['conversationId'],
      userId: json['userId'],
      recipientId: json['recipientId'],
      postId: json['postId'],
      message: rawMessage,
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      isRead: json['isRead'],
    );
  }

  toJson() {
    return {
      'conversationId': conversationId,
      'userId': userId,
      'recipientId': recipientId,
      'postId': postId,
      'message': message,
      'timestamp': timestamp != null ? Timestamp.fromDate(timestamp!) : null,
      'isRead': isRead,
    };
  }

  MessageEntity toEntity() {
    return MessageEntity(
      conversationId: conversationId,
      userId: userId,
      recipientId: recipientId,
      postId: postId,
      message: message,
      timestamp: timestamp,
      isRead: isRead,
    );
  }
}
