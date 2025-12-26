import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sivi_chat/chat_screen/presentation/Bloc/bloc/chat_msg_bloc.dart';
import 'package:my_sivi_chat/core/utils/app_colors.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/chat_message_entity.dart';
import '../Bloc/state/chat_msg_state.dart';
import '../widget/chat_bubble_widget.dart';
import '../widget/chat_msg_app_bar.dart';

class ChatMessageScreen extends StatelessWidget {
  final String name;
  final String lastSeen;
  const ChatMessageScreen({
    super.key,
    required this.name,
    required this.lastSeen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTxt,
      appBar: ChatAppBar(
        userName: name,
        isOnline: lastSeen.toLowerCase() == 'online',
      ),
      body: BlocBuilder<ChatMessageBloc, ChatState>(
        builder: (context, state) {
          bool isLoading = state is ChatLoading;
          if (isLoading || state is ChatLoaded) {
            final userMsg = switch (state) {
              ChatLoaded(:final messages) => messages,
              _ => List.generate(
                15,
                (index) => ChatMessageEntity.placeHolder(index.isOdd),
              ),
            };
            return Skeletonizer(
              enabled: isLoading,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: userMsg.length,
                itemBuilder: (context, index) {
                  final msg = userMsg[index];

                  return ChatMessageBubble(
                    message: msg.message,
                    time: msg.msgTime,
                    isSender: msg.isSender,
                    userInitial: name,
                  );
                },
              ),
            );
          }

          if (state is ChatError) {
            return Text(state.message, style: AppFonts.regular12w400());
          }

          return const SizedBox();
        },
      ),
    );
  }
}
