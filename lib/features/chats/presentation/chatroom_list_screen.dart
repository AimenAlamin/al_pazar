import 'package:al_pazar/core/helpers/extensions.dart';
import 'package:al_pazar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../domain/entity/chatroom_entity.dart';
import 'cubit/chat_cubit.dart';
import 'package:al_pazar/core/helpers/get_user.dart';

/// ✅ Displays all chatrooms the user is involved in
class ChatroomListScreen extends StatefulWidget {
  const ChatroomListScreen({super.key});

  @override
  State<ChatroomListScreen> createState() => _ChatroomListScreenState();
}

class _ChatroomListScreenState extends State<ChatroomListScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    userId = getUserSavedData().uId; // ✅ Get current user ID
    context.read<ChatCubit>().fetchChatRooms(userId); // ✅ Fetch chatrooms
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatRoomsLoaded) {
            if (state.chatRooms.isEmpty) {
              return const Center(child: Text("No chats yet."));
            }
            return ListView.builder(
              itemCount: state.chatRooms.length,
              itemBuilder: (context, index) {
                final chatRoom = state.chatRooms[index];
                return _buildChatRoomTile(chatRoom);
              },
            );
          } else if (state is ChatError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  /// ✅ Builds each chatroom list tile
  Widget _buildChatRoomTile(ChatRoomEntity chatRoom) {
    String formattedTime = DateFormat.jm().format(chatRoom.lastMessageTime);

    // ✅ Determine the correct recipient name dynamically
    String recipientName = (userId == chatRoom.sellerID)
        ? chatRoom.buyerName!
        : chatRoom.sellerName!;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatRoom.postPhotoUrl ?? ""),
      ),

      /// ✅ Show the correct recipient's name dynamically
      title: Text(recipientName,
          style: const TextStyle(fontWeight: FontWeight.bold)),

      /// ✅ Show the post title below recipient name
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(chatRoom.postTitle ?? "No Title",
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(chatRoom.lastMessage ?? "No messages yet",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),

      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedTime,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          if (chatRoom.unreadCount[userId] != null &&
              chatRoom.unreadCount[userId]! > 0)
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                chatRoom.unreadCount[userId]!.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () {
        // ✅ Navigate to DmScreen when tapped
        context.pushNamed(Routes.dmScreen, arguments: chatRoom);
      },
    );
  }
}
