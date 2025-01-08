import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:bloc/bloc.dart';

import '../../entity/chatroom_entity.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;

  ChatCubit(this.chatRepo) : super(ChatInitial());

  Future<void> createChatRoom(ChatRoomEntity chatroomEntity) async {
    emit(ChatLoading());
    var result = await chatRepo.createChatRoom(chatroomEntity);
    result.fold((failure) {
      emit(
        ChatRoomFailure(failure.message),
      );
    }, (success) {
      emit(
        ChatRoomCreated(),
      );
    });
  }

  // void getChatrooms(String userID) {
  //   emit(ChatLoading());
  //   chatRepo.getChatrooms(userID).listen(
  //     (chatrooms) {
  //       emit(ChatRoomsLoadedSuccess(chatrooms));
  //     },
  //     onError: (e) {
  //       emit(ChatRoomFailure(e.toString()));
  //     },
  //   );
  // }

  // void getMessages(String chatroomID) {
  //   emit(ChatLoading());
  //   chatRepo.getMessages(chatroomID).listen(
  //     (messages) {
  //       emit(MessagesLoadedSuccess(messages));
  //     },
  //     onError: (e) {
  //       emit(ChatRoomFailure(e.toString()));
  //     },
  //   );
  // }

  // Future<void> sendMessage(
  //     {required String chatroomID, required MessageEntity message}) async {
  //   emit(ChatLoading());
  //   final result = await chatRepo.sendMessage(chatroomID, message);
  //   result.fold(
  //     (failure) => emit(ChatRoomFailure(failure.message)),
  //     (_) => emit(ChatRoomCreated()),
  //   );
  // }

  // Future<void> markMessagesAsRead({
  //   required String chatroomID,
  //   required String userID,
  // }) async {
  //   try {
  //     await chatRepo.markMessagesAsRead(chatroomID: chatroomID, userID: userID);
  //   } catch (e) {
  //     emit(ChatRoomFailure(e.toString()));
  //   }
  // }
}
