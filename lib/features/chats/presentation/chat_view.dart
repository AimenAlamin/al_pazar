import 'package:al_pazar/features/chats/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/dependency_injection.dart';
import '../domain/repo/chat_repo.dart';
import 'chatroom_list_screen.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt<ChatRepo>()),
      child: const ChatroomListScreen(),
    );
  }
}
