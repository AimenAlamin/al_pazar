import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/core/helpers/endpoints.dart';

import 'package:al_pazar/core/services/data_serivce.dart';
import 'package:al_pazar/features/chats/data/model/chatroom_model.dart';
import 'package:al_pazar/features/chats/data/model/message_model.dart';
import 'package:al_pazar/features/chats/domain/entity/chatroom_entity.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:dartz/dartz.dart';

class ChatRepoImpl implements ChatRepo {
  final DatabaseService dataService;

  ChatRepoImpl(this.dataService);

  @override
  Future<Either<Failure, void>> createChatRoom(
      ChatRoomEntity chatroomEntity) async {
    try {
      List<String> ids = [
        chatroomEntity.buyerID,
        chatroomEntity.sellerID,
        chatroomEntity.postID
      ];
      ids.sort();
      final chatroomID = ids.join('_');

      await dataService.addData(
        path: BackEndpoint.chatroomsCollection,
        data: ChatRoomModel.fromEntity(chatroomEntity).toJson(),
        documentId: chatroomID,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to create chatroom"));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(
      MessageEntity messageEntity, ChatRoomEntity? chatroomEntity) async {
    try {
      List<String> ids = [
        chatroomEntity!.buyerID,
        chatroomEntity.sellerID,
        chatroomEntity.postID
      ];
      ids.sort();
      final chatroomID = ids.join('_');
      await dataService.addData(
        path: BackEndpoint.chatroomsCollection,
        data: ChatRoomModel.fromEntity(chatroomEntity).toJson(),
        documentId: chatroomID,
        subCollection: BackEndpoint.messagesCollection,
        subData: MessageModel.fromEntity(messageEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to send message"));
    }
  }

  Future<String> _getUserName(String userID) async {
    final users = await dataService.getData(path: 'users');
    final user = users.firstWhere((user) => user['uId'] == userID);
    return user['name'];
  }

  @override
  Stream<List<ChatRoomEntity>> getChatrooms(String userID) {
    return dataService.getData(path: 'chatrooms').asStream().map((snapshot) =>
        snapshot
            .where(
                (doc) => doc['buyerID'] == userID || doc['sellerID'] == userID)
            .map((doc) => ChatRoomModel.fromJson(doc).toEntity())
            .toList());
  }

  @override
  Stream<List<MessageEntity>> getMessages(String chatroomID) {
    return dataService
        .getData(path: 'chatrooms/$chatroomID/messages')
        .asStream()
        .map((snapshot) => snapshot
            .map((doc) => MessageModel.fromJson(doc).toEntity())
            .toList());
  }

  @override
  Future<void> markMessagesAsRead({
    required String chatroomID,
    required String userID,
  }) async {
    final messages = await dataService.getData(
        path: 'chatrooms/$chatroomID/messages',
        query: {'receiverID': userID, 'isRead': false});

    for (var message in messages) {
      await dataService.addData(
        path: 'chatrooms/$chatroomID/messages/${message['id']}',
        data: {'isRead': true},
      );
    }

    await dataService.addData(
      path: 'chatrooms/$chatroomID',
      data: {'unreadCount': 0},
    );
  }
}
