class MessageEntity {
  final String senderID;
  final String receiverID;

  final String message;
  final DateTime timestamp;
  final bool isRead;

  MessageEntity({
    required this.senderID,
    required this.receiverID,
    required this.message,
    required this.timestamp,
    required this.isRead,
  });
}
