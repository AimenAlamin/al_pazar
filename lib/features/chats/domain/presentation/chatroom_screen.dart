import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/features/chats/domain/entity/chatroom_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/message_entity.dart';
import 'cubit/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  final ChatRoomEntity chatRoomEntity;

  const ChatScreen({
    super.key,
    required this.chatRoomEntity,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late final String chatroomID;
  @override
  void initState() {
    super.initState();
    // Create chatroom ID using buyerID, sellerID, and postID
    List<String> ids = [
      widget.chatRoomEntity.buyerID,
      widget.chatRoomEntity.sellerID,
      widget.chatRoomEntity.postID
    ];
    ids.sort();
    chatroomID = ids.join('_'); // Ensure consistent and unique chatroom ID
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatRoomEntity.recipientName),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is MessagesLoadedSuccess) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isSentByMe =
                          message.senderID == getUserSavedData().uId;
                      return Align(
                        alignment: isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSentByMe ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            message.message,
                            style: TextStyle(
                              color: isSentByMe ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatRoomFailure) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final messageText = _messageController.text.trim();
                    if (messageText.isNotEmpty) {
                      final String currentUserID = getUserSavedData().uId;
                      final String receiverID =
                          currentUserID == widget.chatRoomEntity.buyerID
                              ? widget.chatRoomEntity.sellerID
                              : widget.chatRoomEntity.buyerID;
                      MessageEntity message = MessageEntity(
                        message: messageText,
                        senderID: currentUserID,
                        receiverID: receiverID,
                        timestamp: DateTime.now(),
                        isRead: false,
                      );
                      context
                          .read<ChatCubit>()
                          .sendMessage(message, chatroomID);
                      _messageController.clear();
                    }
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
