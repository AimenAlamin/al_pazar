import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';

/// A model class representing a message in Firestore.
/// This model is used to convert between Firestore data and `MessageEntity`.
class MessageModel {
  /// Unique ID for this message.
  final String messageId;

  /// ID of the user who sent the message.
  final String senderId;

  /// ID of the user receiving the message.
  final String recipientId;

  /// Text content of the message (nullable if it's an image/video).
  final String? message;

  /// If the recipient has opened the chatroom, this is `true`.
  final bool isRead;

  /// Timestamp of when the message was sent.
  final DateTime timestamp;

  /// Constructor for creating a `MessageModel` instance.
  MessageModel({
    required this.messageId,
    required this.senderId,
    required this.recipientId,
    this.message,
    required this.isRead,
    required this.timestamp,
  });

  /// Converts a `MessageEntity` into a `MessageModel`.
  /// Used when sending message data to Firestore.
  factory MessageModel.fromEntity(MessageEntity messageEntity) {
    return MessageModel(
      messageId: messageEntity.messageId,
      senderId: messageEntity.senderId,
      recipientId: messageEntity.recipientId,
      message: messageEntity.message,
      isRead: messageEntity.isRead,
      timestamp: messageEntity.timestamp,
    );
  }

  /// Converts Firestore JSON data into a `MessageModel`.
  /// Used when fetching messages from Firestore.
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'],
      senderId: json['senderId'],
      recipientId: json['recipientId'],
      message: json['message'],

      isRead: json['isRead'] ?? false, // Default false if missing
      timestamp: json['timestamp'],
    );
  }

  /// Converts the `MessageModel` into a Firestore-compatible JSON object.
  /// Used when saving messages to Firestore.
  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'recipientId': recipientId,
      'message': message,
      'isRead': isRead,
      'timestamp': timestamp,
    };
  }

  /// Converts the `MessageModel` into a `MessageEntity`.
  /// Used when retrieving messages from Firestore and displaying them in the UI.
  MessageEntity toEntity() {
    return MessageEntity(
      messageId: messageId,
      senderId: senderId,
      recipientId: recipientId,
      message: message,
      isRead: isRead,
      timestamp: timestamp,
    );
  }
}
