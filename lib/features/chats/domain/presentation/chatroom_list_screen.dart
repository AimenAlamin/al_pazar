// ChatroomListScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chatroom_screen.dart';
import 'cubit/chat_cubit.dart';

class ChatroomListScreen extends StatelessWidget {
  final String userID;

  const ChatroomListScreen({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatrooms'),
      ),
      body: BlocProvider(
        create: (context) => ChatCubit(context.read())..getChatrooms(userID),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChatRoomsLoadedSuccess) {
              if (state.chatrooms.isEmpty) {
                return const Center(child: Text('No chatrooms available'));
              }
              return ListView.builder(
                itemCount: state.chatrooms.length,
                itemBuilder: (context, index) {
                  final chatroom = state.chatrooms[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(chatroom.postPhotoUrl),
                    ),
                    title: Text(chatroom.recipientName),
                    subtitle: Text(chatroom.lastMessage),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            chatroomID: chatroom.chatroomID,
                            recipientName: chatroom.recipientName,
                            userID: userID,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is ChatError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
