class MessageEntity {
  final String? conversationId;
  final String? userId;
  final String? recipientId;
  final String? postId;
  final String? message;
  final DateTime? timestamp;
  final bool? isRead;

  MessageEntity({
    this.message,
    this.timestamp,
    this.isRead,
    this.conversationId,
    this.userId,
    this.recipientId,
    this.postId,
  });
}
