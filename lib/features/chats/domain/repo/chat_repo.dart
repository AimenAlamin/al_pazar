import 'package:al_pazar/core/errors/failure.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failure, void>> sendMessage(MessageEntity messageEntity);
}
