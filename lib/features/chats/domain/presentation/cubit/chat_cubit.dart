import 'package:al_pazar/core/helpers/endpoints.dart';
import 'package:al_pazar/features/chats/data/model/message_model.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;

  ChatCubit(this.chatRepo) : super(ChatInitial());

  Future<void> sendMessage(MessageEntity messageEntity) async {
    emit(ChatLoading());
    var result = await chatRepo.sendMessage(messageEntity);
    result.fold((failure) {
      emit(
        MessageSentFaliure(failure.message),
      );
    }, (success) {
      emit(
        MessageSentSuccess(),
      );
    });
  }

  // Stream messages for a specific conversationId
  Stream<List<MessageEntity>> getMessages(String conversationId) {
    return FirebaseFirestore.instance
        .collection(BackEndpoint.messagesCollection)
        .where('conversationId', isEqualTo: conversationId)
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return MessageModel.fromJson(doc.data()).toEntity();
            }).toList());
  }
}
