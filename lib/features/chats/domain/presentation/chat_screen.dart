import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/features/chats/domain/entity/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../add_post/domain/entities/post_entity.dart';
import 'cubit/chat_cubit.dart';

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
  final ScrollController _scrollController = ScrollController();

  /// Build a conversation ID in the same way your code shows
  /// e.g. (user1, user2)_postId
  String get conversationId {
    final String currentUserID = getUserSavedData().uId;
    List<String> ids = [currentUserID, widget.postDetails.userId];
    ids.sort();
    return '${ids.join('_')}_${widget.postDetails.postId}';
  }

  @override
  void initState() {
    super.initState();
    // You might not need initState if you're only using StreamBuilder below.
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Helper to auto-scroll to bottom after new messages
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  /// Invokes the ChatCubit to send a message
  void _onSendPressed() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      final currentUserID = getUserSavedData().uId;
      final String receiverID = widget.postDetails.userId;

      final messageEntity = MessageEntity(
        conversationId: conversationId,
        postId: widget.postDetails.postId,
        message: messageText, // plaintext here
        userId: currentUserID,
        recipientId: receiverID,
        timestamp: DateTime.now(),
        isRead: false,
      );

      // Call our ChatCubit -> ChatRepo -> ChatRepoImpl -> encrypt & store
      context.read<ChatCubit>().sendMessage(messageEntity);

      _messageController.clear();
      // Optionally scroll to bottom
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.postDetails.sellerName),
      ),
      body: Column(
        children: [
          // Display messages in a ListView with a StreamBuilder
          Expanded(
            child: StreamBuilder<List<MessageEntity>>(
              stream: context.read<ChatCubit>().getMessages(conversationId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                final messages = snapshot.data ?? [];
                if (messages.isEmpty) {
                  return const Center(child: Text("No messages yet."));
                }

                // Auto-scroll after messages load
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollToBottom();
                });

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
                              // This is the **decrypted** message now
                              message.message ?? "",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
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

          // Message input field + Send button
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
                  onPressed: _onSendPressed,
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
