class ChatRoomEntity {
  final String? postID;
  final String? chatRoomID;
  final String? buyerID;
  final String? sellerID;
  final String? postTitle;
  final String? postPhotoUrl;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  String? recipientName;
  final Map<String, int> unreadCount; // Tracks unread messages per user
  final String? price;
  final String? currency;

  ChatRoomEntity({
    this.postID,
    this.buyerID,
    this.chatRoomID,
    this.sellerID,
    this.lastMessage,
    this.lastMessageTime,
    this.postTitle,
    this.postPhotoUrl,
    this.recipientName,
    this.price,
    this.currency,
    required this.unreadCount,
  });
}
