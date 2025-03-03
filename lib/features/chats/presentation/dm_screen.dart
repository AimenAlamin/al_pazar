import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/core/theming/colors.dart';
import 'package:al_pazar/core/theming/styles.dart';
import 'package:al_pazar/features/chats/domain/entity/chatroom_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../domain/entity/message_entity.dart';
import 'cubit/chat_cubit.dart';

/// ✅ Direct Messages Screen
/// ✅ Fetches messages in real-time
/// ✅ Displays messages & allows sending messages

class DmScreen extends StatefulWidget {
  final ChatRoomEntity chatRoomEntity;

  const DmScreen({super.key, required this.chatRoomEntity});

  @override
  State<DmScreen> createState() => _DmScreenState();
}

class _DmScreenState extends State<DmScreen> {
  final TextEditingController _messageController = TextEditingController();

  late final String chatRoomId;
  late final String recipientID;
  late final String senderID;

  bool chatRoomCreated = false;

  @override
  void initState() {
    super.initState();

    /// ✅ Extract IDs from ChatRoomEntity
    chatRoomId = widget.chatRoomEntity.chatRoomID!;
    recipientID = widget.chatRoomEntity.sellerID!;
    senderID = getUserSavedData().uId;

    /// Fetch messages from Firestore (Real-Time)
    context.read<ChatCubit>().fetchMessages(chatRoomId);
  }

  /// ✅ Sends a message & ensures the chatroom is created
  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final messageEntity = MessageEntity(
      messageId: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderID,
      recipientId: recipientID,
      message: _messageController.text.trim(),
      timestamp: DateTime.now(),
      isRead: false,
    );

    if (!chatRoomCreated) {
      /// ✅ First Message: Create Chatroom Before Sending Message
      context.read<ChatCubit>().createChatRoom(widget.chatRoomEntity).then((_) {
        setState(() {
          chatRoomCreated = true;
        });
        context.read<ChatCubit>().sendMessage(messageEntity, chatRoomId);
      });
    } else {
      /// ✅ If Chatroom Already Exists, Just Send Message
      context.read<ChatCubit>().sendMessage(messageEntity, chatRoomId);
    }

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final String reciptName = widget.chatRoomEntity.recipientName!;
    final String firstLetter = reciptName[0].toUpperCase();
    return Scaffold(
      /// ✅ Displays seller
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.lightRead,
              ),
              alignment: Alignment.center,
              child: Text(
                firstLetter,
                style: TextStyles.font20BlueBold,
              ),
            ),
            const SizedBox(width: 10),
            Text(widget.chatRoomEntity.recipientName!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),

      /// ✅ Chat Messages & Input Field
      body: Column(
        children: [
          // Fixed Post Header Post detials
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image.network(
                      widget.chatRoomEntity.postPhotoUrl!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.chatRoomEntity.recipientName!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text(widget.chatRoomEntity.price!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 5),
                          Text(widget.chatRoomEntity.currency!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ],
              )),

          /// ✅ Fetches Messages in Real-Time
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is MessagesLoaded) {
                  if (state.messages.isEmpty) {
                    return const Center(child: Text("No messages yet."));
                  }
                  return ListView.builder(
                    reverse: true,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages.reversed.toList()[index];
                      final isMe = message.senderId == senderID;

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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.message ?? "📷 Media",
                                style: TextStyle(
                                  color: isMe ? Colors.white : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      2), // ✅ Reduce space between message & time
                              Text(
                                DateFormat.jm().format(message
                                    .timestamp), // Format time as HH:MM AM/PM, // Show formatted time below the message
                                style: TextStyle(
                                  color: isMe
                                      ? Colors.white70
                                      : Colors.black54, // Slightly faded text
                                  fontSize:
                                      12, // Smaller font size for timestamp
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          /// ✅ Message Input Field
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
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
