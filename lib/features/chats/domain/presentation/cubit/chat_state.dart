part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class MessageSentSuccess extends ChatState {}

class MessageSentFaliure extends ChatState {
  final String message;

  MessageSentFaliure(this.message);
}

class MessagesLoadedSuccess extends ChatState {
  final List<MessageEntity> messages;

  MessagesLoadedSuccess(this.messages);
}
