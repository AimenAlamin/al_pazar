part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatRoomCreated extends ChatState {}

class ChatRoomsLoadedSuccess extends ChatState {
  final List<ChatRoomEntity> chatrooms;

  ChatRoomsLoadedSuccess(this.chatrooms);
}

class MessagesLoadedSuccess extends ChatState {
  final List<MessageEntity> messages;

  MessagesLoadedSuccess(this.messages);
}

class ChatRoomFailure extends ChatState {
  final String message;

  ChatRoomFailure(this.message);
}
