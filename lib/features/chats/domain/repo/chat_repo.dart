import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/features/chats/domain/entity/chatroom_entity.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failure, void>> createChatRoom(ChatRoomEntity chatroomEntity);

  //Future<void> deleteChatRoom(String chatRoomId);
  //Future<Either<Failure, List<ChatRoomEntity>>> getChatRooms(String userId);
  Future<Either<Failure, void>> sendMessage(
      MessageEntity messageEntity, ChatRoomEntity? chatroomEntity);
  Future<void> markMessagesAsRead({
    required String chatroomID,
    required String userID,
  });
  Stream<List<ChatRoomEntity>> getChatrooms(String userID);
  Stream<List<MessageEntity>> getMessages(String chatroomID);
}
