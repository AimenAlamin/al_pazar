import 'package:al_pazar/core/errors/failure.dart';

import 'package:al_pazar/core/helpers/endpoints.dart';

import 'package:al_pazar/features/chats/data/model/message_model.dart';
import 'package:al_pazar/features/chats/domain/entity/chatroom_entity.dart';

import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/message_entity.dart';
import '../model/chatroom_model.dart';

class ChatRepoImpl implements ChatRepo {
  final FirebaseFirestore firestore;
  final String chatpath = BackEndpoint.chatroomsCollection;
  final String dmpath = BackEndpoint.dmsCollection;

  ChatRepoImpl({required this.firestore});

  ///  Creates a chatroom if it doesn’t already exist
  @override
  Future<Either<Failure, void>> createChatRoom(
      ChatRoomEntity chatroomEntity) async {
    try {
      final chatRoomRef =
          firestore.collection(chatpath).doc(chatroomEntity.chatRoomID);
      final doc = await chatRoomRef.get();

      if (!doc.exists) {
        await chatRoomRef
            .set(ChatRoomModel.fromEntity(chatroomEntity).toJson());
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to create chatroom: ${e.toString()}"));
    }
  }

  ///  Sends a message and updates chatroom metadata atomically
  @override
  Future<Either<Failure, void>> sendMessage(
      MessageEntity messageEntity, String chatroomID) async {
    try {
      final chatRoomRef = firestore.collection(chatpath).doc(chatroomID);
      final messageRef = chatRoomRef.collection(dmpath).doc();

      final batch = firestore.batch(); //  Use batch writes for consistency

      //  Add the new message
      batch.set(messageRef, MessageModel.fromEntity(messageEntity).toJson());

      //  Update chatroom metadata (last message, unread count)
      batch.update(chatRoomRef, {
        'lastMessage': messageEntity.message ?? "",
        'lastMessageTime': FieldValue
            .serverTimestamp(), //  Timestamp of server time not client time
        'unreadCount.${messageEntity.senderId}': FieldValue.increment(0),
        'unreadCount.${messageEntity.recipientId}': FieldValue.increment(1),
      });

      await batch
          .commit(); //  Ensures atomic operation (Commits all Firestore operations at once.)
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to send message: ${e.toString()}"));
    }
  }

  ///  Marks messages as read when the user opens the chat
  @override
  Future<Either<Failure, void>> markMessagesAsRead(
      String chatRoomId, String recipientId) async {
    try {
      final chatRoomRef = firestore.collection(chatpath).doc(chatRoomId);
      final batch = firestore.batch();

      //  Reset unread count for the current user
      batch.update(chatRoomRef, {'unreadCount.$recipientId': 0});

      //  Mark unread messages as read
      final unreadMessages = await chatRoomRef
          .collection(dmpath)
          .where('recipientId', isEqualTo: recipientId)
          .where('isRead', isEqualTo: false)
          .get();

      for (var doc in unreadMessages.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      await batch.commit();
      return const Right(null);
    } catch (e) {
      return Left(
          ServerFailure("Failed to mark messages as read: ${e.toString()}"));
    }
  }

  ///  Fetch all chatrooms where the user is a buyer or seller (Real-time)
  @override
  Stream<Either<Failure, List<ChatRoomEntity>>> getChatRooms(String userId) {
    try {
      return firestore
          .collection(chatpath)
          .where(Filter.or(
            Filter("buyerID", isEqualTo: userId),
            Filter("sellerID", isEqualTo: userId),
          )) // ✅ Fetch chatrooms where user is either buyer or seller
          .orderBy("lastMessageTime", descending: true)
          .snapshots()
          .map((snapshot) {
        final chatRooms = snapshot.docs.map((doc) {
          return ChatRoomModel.fromJson(doc.data()).toEntity();
        }).toList();
        return Right(chatRooms);
      });
    } catch (e) {
      return Stream.value(Left(ServerFailure(e.toString())));
    }
  }
  // Stream<Either<Failure, List<ChatRoomEntity>>> getChatRooms(String userId) {
  //   try {
  //     return firestore
  //         .collection(chatpath)
  //         .where("buyerID", isEqualTo: userId) // ✅ Simpler Query
  //         .snapshots()
  //         .map((snapshot) {
  //       final chatRooms = snapshot.docs.map((doc) {
  //         return ChatRoomModel.fromJson(doc.data()).toEntity();
  //       }).toList();
  //       return Right(chatRooms);
  //     });
  //   } catch (e) {
  //     return Stream.value(Left(ServerFailure(e.toString())));
  //   }
  // }

  ///  Fetch messages inside a specific chatroom (Real-time)
  @override
  Stream<Either<Failure, List<MessageEntity>>> getMessages(String chatRoomId) {
    try {
      return firestore
          .collection(chatpath)
          .doc(chatRoomId)
          .collection(dmpath)
          .orderBy('timestamp',
              descending: false) // Messages should be in ascending order
          .snapshots()
          .map((snapshot) {
        final messages = snapshot.docs.map((doc) {
          return MessageModel.fromJson(doc.data()).toEntity();
        }).toList();
        return Right(messages);
      });
    } catch (e) {
      return Stream.value(Left(ServerFailure(e.toString())));
    }
  }
}
