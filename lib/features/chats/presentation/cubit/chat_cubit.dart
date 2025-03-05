import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entity/chatroom_entity.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;

  ChatCubit(this.chatRepo) : super(ChatInitial());

  ///  Fetch Chatrooms (Real-Time Updates)
  void fetchChatRooms(String userId) {
    emit(ChatLoading());
    chatRepo.getChatRooms(userId).listen((event) {
      event.fold(
        (failure) => emit(ChatError(failure.message)),
        (chatRooms) => emit(ChatRoomsLoaded(chatRooms)),
      );
    });
  }

  ///  Fetch Messages in a Chatroom (Real-Time Updates)
  void fetchMessages(String chatRoomId) {
    emit(ChatLoading());
    chatRepo.getMessages(chatRoomId).listen((event) {
      event.fold(
        (failure) => emit(ChatError(failure.message)),
        (messages) => emit(MessagesLoaded(messages)),
      );
    });
  }

  /// create chatroom
  Future<void> createChatRoom(ChatRoomEntity chatroomEntity) async {
    final result = await chatRepo.createChatRoom(chatroomEntity);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => null, // No need to emit a new state, messages update in real-time
    );
  }

  ///  Send Message
  Future<void> sendMessage(
      MessageEntity messageEntity, ChatRoomEntity chatroomEntity) async {
    final result = await chatRepo.sendMessage(messageEntity, chatroomEntity);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => null, // No need to emit a new state, messages update in real-time
    );
  }

  ///  Mark Messages as Read
  Future<void> markMessagesAsRead(
      String chatRoomId, String currentUserId) async {
    final result = await chatRepo.markMessagesAsRead(chatRoomId, currentUserId);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => null, // No need to emit a new state, messages update in real-time
    );
  }
}
