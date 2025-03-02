part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  // Empty props for all states. props is a list of properties that will be used to determine if two states are equal.
  @override
  List<Object?> get props => [];
}

///  Initial State (before fetching chat data)
class ChatInitial extends ChatState {}

///  Loading State (when fetching chatrooms/messages)
class ChatLoading extends ChatState {}

///  Chatrooms Loaded Successfully
class ChatRoomsLoaded extends ChatState {
  final List<ChatRoomEntity> chatRooms;
  const ChatRoomsLoaded(this.chatRooms);

  @override
  List<Object?> get props => [chatRooms];
}

///  Messages fetched  Successfully
class MessagesLoaded extends ChatState {
  final List<MessageEntity> messages;
  const MessagesLoaded(this.messages);

  @override
  List<Object?> get props => [messages];
}

///  Chat Error State
class ChatError extends ChatState {
  final String message;
  const ChatError(this.message);

  @override
  List<Object?> get props => [message];
}
