import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';

import '../entity/chatroom_entity.dart';

abstract class ChatRepo {
  Future<Either<Failure, void>> sendMessage(
      MessageEntity messageEntity, ChatRoomEntity chatroomEntity);
  Future<Either<Failure, void>> createChatRoom(ChatRoomEntity chatroomEntity);
  Stream<Either<Failure, List<MessageEntity>>> getMessages(String chatRoomId);
  Stream<Either<Failure, List<ChatRoomEntity>>> getChatRooms(String userId);
  Future<Either<Failure, void>> markMessagesAsRead(
      String chatRoomId, String currentUserId);
}
