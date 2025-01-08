class ChatRoomEntity {
  final String chatroomID;
  final String postID;
  final String buyerID;
  final String sellerID;
  final String postTitle;
  final String postPhotoUrl;
  final String lastMessage;
  final DateTime lastMessageTimestamp;
  final int unreadCount;
  final String recipientName;

  ChatRoomEntity({
    required this.chatroomID,
    required this.postID,
    required this.buyerID,
    required this.sellerID,
    required this.postTitle,
    required this.postPhotoUrl,
    required this.lastMessage,
    required this.lastMessageTimestamp,
    required this.unreadCount,
    required this.recipientName,
  });
}
