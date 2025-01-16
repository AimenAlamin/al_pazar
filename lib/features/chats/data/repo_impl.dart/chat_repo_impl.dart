import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/core/helpers/endpoints.dart';
import 'package:al_pazar/core/services/data_serivce.dart';
import 'package:al_pazar/features/chats/data/model/message_model.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:dartz/dartz.dart';

class ChatRepoImpl implements ChatRepo {
  final DatabaseService dataService;

  ChatRepoImpl(this.dataService);

  @override
  Future<Either<Failure, void>> sendMessage(MessageEntity messageEntity) async {
    try {
      await dataService.addData(
        path: BackEndpoint.messagesCollection,
        data: MessageModel.fromEntity(messageEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to send message"));
    }
  }
}
