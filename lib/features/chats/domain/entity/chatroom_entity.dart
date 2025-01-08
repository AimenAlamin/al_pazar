class ChatRoomEntity {
  final String postID;
  final String buyerID;
  final String sellerID;
  final String postTitle;
  final String postPhotoUrl;
  final String recipientName;

  ChatRoomEntity({
    required this.postID,
    required this.buyerID,
    required this.sellerID,
    required this.postTitle,
    required this.postPhotoUrl,
    required this.recipientName,
  });
}
