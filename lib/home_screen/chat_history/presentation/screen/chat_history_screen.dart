import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/chat_history_entity.dart';
import '../Bloc/bloc/chat_history_bloc.dart';
import '../Bloc/state/chat_history_state.dart';
import '../widget/chat_history_card.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen>
    with AutomaticKeepAliveClientMixin {
  // final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ChatHistoryBloc, ChatHistoryState>(
      builder: (context, state) {
        bool isLoading = state is ChatHistoryLoading;

        if (isLoading || state is ChatHistoryLoaded) {
          final userMsg = switch (state) {
            ChatHistoryLoaded(:final chatHistory) => chatHistory,
            _ => List.generate(15, (_) => ChatHistoryEntity.placeHolder()),
          };
          return Skeletonizer(
            enabled: isLoading,
            child: ListView.builder(
              // controller: _controller,
              key: const PageStorageKey('chat_msg_list'),
              padding: EdgeInsetsGeometry.zero,
              itemCount: userMsg.length,
              itemBuilder: (context, index) {
                final user = userMsg[index];
                return ChatHistoryCard(chatHistory: user);
              },
            ),
          );
        }

        if (state is ChatHistoryError) {
          return Text(state.message).center;
        }

        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
