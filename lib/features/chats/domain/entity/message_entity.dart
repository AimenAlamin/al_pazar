class MessageEntity {
  final String messageId; // Unique ID for this message
  final String senderId; // ID of the user who sent the message
  final String recipientId; // ID of the user receiving the message
  final String?
      message; // Text content of the message (nullable if it's an image/video)final String? mediaUrl; // URL if the message contains an image, video, or file
  final bool isRead; // If the recipient opened the chat
  final DateTime timestamp; // When the message was sent

  MessageEntity({
    required this.messageId,
    required this.senderId,
    required this.recipientId,
    this.message,
    required this.isRead,
    required this.timestamp,
  });
}
