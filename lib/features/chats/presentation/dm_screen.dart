import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/features/chats/domain/entity/chatroom_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/entity/message_entity.dart';
import 'cubit/chat_cubit.dart';

///  Fetches messages in real-time & marks as read when opened
class DmScreen extends StatefulWidget {
  final ChatRoomEntity chatRoomEntity;

  const DmScreen({
    super.key,
    required this.chatRoomEntity,
  });

  @override
  State<DmScreen> createState() => _DmScreenState();
}

class _DmScreenState extends State<DmScreen> {
  final TextEditingController _messageController = TextEditingController();

  late final String chatRoomId = widget.chatRoomEntity.chatRoomID!;
  late final String recipientID = widget.chatRoomEntity.sellerID!;
  bool chatRoomCreated = false; //  Track if the chatroom has been created

  @override
  void initState() {
    super.initState();

    // ///  Fetch Messages in Real-Time
    // context.read<ChatCubit>().fetchMessages(chatRoomId);

    // ///  Mark Messages as Read when Chat is Opened
    // context
    //     .read<ChatCubit>()
    //     .markMessagesAsRead(chatRoomId, getUserSavedData().uId);
  }

  ///  Sends a Message & Ensures Chatroom is Created
  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final messageEntity = MessageEntity(
      messageId: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: getUserSavedData().uId,
      recipientId: recipientID,
      message: _messageController.text.trim(),
      timestamp: DateTime.now(),
      isRead: false,
    );

    if (!chatRoomCreated) {
      ///  First Message: Create Chatroom Before Sending Message
      context.read<ChatCubit>().createChatRoom(widget.chatRoomEntity).then((_) {
        setState(() {
          chatRoomCreated = true;
        });
        context.read<ChatCubit>().sendMessage(messageEntity, chatRoomId);
      });
    } else {
      ///  If Chatroom Already Exists, Just Send Message
      context.read<ChatCubit>().sendMessage(messageEntity, chatRoomId);
    }

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///  Seller Info Displayed in AppBar
        title: Row(
          children: [
            // CircleAvatar(backgroundImage: NetworkImage(widget.postDetails.sellerPhotoUrl ?? "")),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatRoomEntity.recipientName!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.chatRoomEntity.postTitle!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ///  Chat Messages (ListView)
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MessagesLoaded) {
                  if (state.messages.isEmpty) {
                    return const Center(child: Text("No messages yet."));
                  }
                  return ListView.builder(
                    reverse: true,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isMe = message.senderId == getUserSavedData().uId;

                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message.message ?? "📷 Media",
                            style: TextStyle(
                                color: isMe ? Colors.white : Colors.black),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),

          ///  Message Input Field
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage, //  Send message when tapped
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
