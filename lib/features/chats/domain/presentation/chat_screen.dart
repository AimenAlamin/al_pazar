import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/message_entity.dart';
import 'cubit/chat_cubit.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final PostEntity postDetails;

  const ChatScreen({
    super.key,
    required this.postDetails,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController =
      ScrollController(); // Add ScrollController
  // Lazy initialization of conversation ID
  String get conversationId {
    final String currentUserID = getUserSavedData().uId;
    List<String> ids = [currentUserID, widget.postDetails.userId];
    ids.sort();
    return '${ids.join('_')}_${widget.postDetails.postId}';
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  // **Method to Scroll to the Bottom**
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postDetails.sellerName),
      ),
      body: Column(
        children: [
          // Display messages in a ListView
          Expanded(
            child: StreamBuilder<List<MessageEntity>>(
              stream: context.read<ChatCubit>().getMessages(conversationId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                final messages = snapshot.data ?? [];
                if (messages.isEmpty) {
                  return const Center(child: Text("No messages yet."));
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isCurrentUser =
                        message.userId == getUserSavedData().uId;
                    final formattedTime = message.timestamp != null
                        ? DateFormat('hh:mm a').format(message.timestamp!)
                        : '';

                    return Align(
                      alignment: isCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isCurrentUser
                              ? Colors.blue[200]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: isCurrentUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.message ?? "",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Message input field
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
                      final String receiverID = widget.postDetails.userId;
                      MessageEntity message = MessageEntity(
                        conversationId: conversationId,
                        postId: widget.postDetails.postId,
                        message: messageText,
                        userId: currentUserID,
                        recipientId: receiverID,
                        timestamp: DateTime.now(),
                        isRead: false,
                      );
                      context.read<ChatCubit>().sendMessage(message);
                      _messageController.clear();
                      // **Scroll to Bottom after sending a message**
                      _scrollToBottom();
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
