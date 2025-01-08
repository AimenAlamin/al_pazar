import '../../domain/entity/chatroom_entity.dart';

class ChatRoomModel {
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

  ChatRoomModel({
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
  //this is a factory constructor that takes a ChatRoomEntity and returns a ChatRoomModel, needed when we want to send the ChatRoomFields to the database
  factory ChatRoomModel.fromEntity(ChatRoomEntity chatroomEntity) {
    return ChatRoomModel(
      chatroomID: chatroomEntity.chatroomID,
      postID: chatroomEntity.postID,
      buyerID: chatroomEntity.buyerID,
      sellerID: chatroomEntity.sellerID,
      postTitle: chatroomEntity.postTitle,
      postPhotoUrl: chatroomEntity.postPhotoUrl,
      lastMessage: chatroomEntity.lastMessage,
      lastMessageTimestamp: chatroomEntity.lastMessageTimestamp,
      unreadCount: chatroomEntity.unreadCount,
      recipientName: chatroomEntity.recipientName,
    );
  }
  //this is a factory constructor that takes a map of strings and dynamic and returns a ChatRoomModel, needed when we want to get the ChatRoomModel from the database
  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      chatroomID: json['chatroomID'],
      postID: json['postID'],
      buyerID: json['buyerID'],
      sellerID: json['sellerID'],
      postTitle: json['postTitle'],
      postPhotoUrl: json['postPhotoUrl'],
      lastMessage: json['lastMessage'],
      lastMessageTimestamp: json['lastMessageTimestamp'],
      unreadCount: json['unreadCount'],
      recipientName: json['recipientName'],
    );
  }
  //this method is used to convert the ChatRoomModel to a map of strings and dynamic, needed when we want to send the ChatRoomModel to the database
  toJson() {
    return {
      'chatroomID': chatroomID,
      'postID': postID,
      'buyerID': buyerID,
      'sellerID': sellerID,
      'postTitle': postTitle,
      'postPhotoUrl': postPhotoUrl,
      'lastMessage': lastMessage,
      'lastMessageTimestamp': lastMessageTimestamp,
      'unreadCount': unreadCount,
      'recipientName': recipientName,
    };
  }

  // this method is used to convert the ChatRoomModel to a ChatRoomEntity, needed when we want to retrieve the data from the database and display it in the UI
  ChatRoomEntity toEntity() {
    return ChatRoomEntity(
      chatroomID: chatroomID,
      postID: postID,
      buyerID: buyerID,
      sellerID: sellerID,
      postTitle: postTitle,
      postPhotoUrl: postPhotoUrl,
      lastMessage: lastMessage,
      lastMessageTimestamp: lastMessageTimestamp,
      unreadCount: unreadCount,
      recipientName: recipientName,
    );
  }
}
