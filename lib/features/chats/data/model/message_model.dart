import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';

class MessageModel {
  final String senderID;
  final String receiverID;

  final String message;
  final DateTime timestamp;
  final bool isRead;

  MessageModel({
    required this.senderID,
    required this.receiverID,
    required this.message,
    required this.timestamp,
    required this.isRead,
  });
  factory MessageModel.fromEntity(MessageEntity messageEntity) {
    return MessageModel(
      senderID: messageEntity.senderID,
      receiverID: messageEntity.receiverID,
      message: messageEntity.message,
      timestamp: messageEntity.timestamp,
      isRead: messageEntity.isRead,
    );
  }
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderID: json['senderID'],
      receiverID: json['receiverID'],
      message: json['message'],
      timestamp: json['timestamp'],
      isRead: json['isRead'],
    );
  }
  toJson() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }

  MessageEntity toEntity() {
    return MessageEntity(
      senderID: senderID,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
      isRead: isRead,
    );
  }
}
