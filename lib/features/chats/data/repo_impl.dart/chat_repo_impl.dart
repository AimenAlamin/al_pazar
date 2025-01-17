import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/core/helpers/encryption.dart';
import 'package:al_pazar/core/helpers/endpoints.dart';
import 'package:al_pazar/core/services/data_serivce.dart';
import 'package:al_pazar/features/chats/data/model/message_model.dart';

import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/message_entity.dart';

class ChatRepoImpl implements ChatRepo {
  final DatabaseService dataService;

  ChatRepoImpl(this.dataService);

  @override
  Future<Either<Failure, void>> sendMessage(MessageEntity messageEntity) async {
    try {
      // 1) Convert to MessageModel
      final messageModel = MessageModel.fromEntity(messageEntity);

      // 2) If there's a plaintext message, encrypt it
      if (messageModel.message != null && messageModel.message!.isNotEmpty) {
        final encrypted = CryptoJSHelper.encryptToBase64(messageModel.message!);
        messageModel.message = encrypted; // store ciphertext
      }

      // 3) Save to Firestore with the ciphertext
      await dataService.addData(
        path: BackEndpoint.messagesCollection,
        data: messageModel.toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to send message: $e"));
    }
  }
}
