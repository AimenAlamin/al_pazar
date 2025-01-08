import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:bloc/bloc.dart';

import '../../entity/chatroom_entity.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;

  ChatCubit(this.chatRepo) : super(ChatInitial());

  Future<void> createChatRoom(String postID, String buyerID, String sellerID,
      String postTitle, String postPhotoUrl) async {
    emit(ChatLoading());
    final result = await chatRepo.createChatRoom(
        postID, buyerID, sellerID, postTitle, postPhotoUrl);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => emit(ChatRoomCreated()),
    );
  }

  void getChatrooms(String userID) {
    emit(ChatLoading());
    chatRepo.getChatrooms(userID).listen(
      (chatrooms) {
        emit(ChatRoomsLoadedSuccess(chatrooms));
      },
      onError: (e) {
        emit(ChatError(e.toString()));
      },
    );
  }

  void getMessages(String chatroomID) {
    emit(ChatLoading());
    chatRepo.getMessages(chatroomID).listen(
      (messages) {
        emit(MessagesLoadedSuccess(messages));
      },
      onError: (e) {
        emit(ChatError(e.toString()));
      },
    );
  }

  Future<void> sendMessage(
      {required String chatroomID, required MessageEntity message}) async {
    emit(ChatLoading());
    final result = await chatRepo.sendMessage(chatroomID, message);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => emit(ChatRoomCreated()),
    );
  }

  Future<void> markMessagesAsRead({
    required String chatroomID,
    required String userID,
  }) async {
    try {
      await chatRepo.markMessagesAsRead(chatroomID: chatroomID, userID: userID);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
