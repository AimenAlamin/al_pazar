import 'package:al_pazar/core/helpers/get_user.dart';
import 'package:al_pazar/features/add_post/domain/entities/post_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/message_entity.dart';
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
  late final String conversationId;
  late final String uniqueUsers;
  final String currentUserID =
      getUserSavedData().uId; // Replace with actual logged-in user ID
  final String currentUserName =
      getUserSavedData().name; // Replace with actual logged-in user name
  @override
  void initState() {
    super.initState();
    // Create chatroom ID using buyerID, sellerID, and postID
    List<String> ids = [
      currentUserID,
      widget.postDetails.userId,
    ];
    ids.sort();
    uniqueUsers = ids.join('_');
    //conversationId = uniqueUsers + '_' + //postID
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
        title: Text(widget.postDetails.sellerName),
      ),
      body: Column(
        children: [
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
                      final String receiverID = widget
                          .postDetails.userId; // Replace with actual seller ID
                      MessageEntity message = MessageEntity(
                        conversationId: conversationId,
                        postId:
                            "//write down the postid which is the document id of the post where a conversation is happening",
                        message: messageText,
                        userId: currentUserID,
                        recipientId: receiverID,
                        timestamp: DateTime.now(),
                        isRead: false,
                      );
                      context.read<ChatCubit>().sendMessage(message);
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
