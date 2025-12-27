import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/chat_screen/presentation/Bloc/bloc/chat_msg_bloc.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';
import 'package:my_sivi_chat/core/utils/app_colors.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/utils/ui_utills.dart';
import '../../domain/entity/chat_message_entity.dart';
import '../Bloc/state/chat_msg_state.dart';
import '../Cubit/cubit/translation_cubit.dart';
import '../Cubit/state/translation_states.dart';
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
      appBar: ChatAppBar(userName: name, isOnline: lastSeen.isOnline),
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
              child: BlocListener<TranslationCubit, TranslationState>(
                listener: (context, state) {
                  if (state is TranslationLoading) {
                    _showTranslatingDialog(context);
                  }

                  if (state is TranslationSuccess) {
                    Navigator.of(context, rootNavigator: true).pop();
                    _showTranslatorBottomSheet(context, state.translatedText);
                  }

                  if (state is TranslationError) {
                    Navigator.of(context, rootNavigator: true).pop();
                    UiUtility.showToast(
                      message: "Translation failed",
                      isFailure: true,
                    );
                  }
                },
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

  void _showTranslatingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text("Translating..."),
            ],
          ),
        );
      },
    );
  }

  void _showTranslatorBottomSheet(BuildContext context, String translatedText) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteTxt,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: 24.allPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.h.heightBox,
              Text(translatedText, style: AppFonts.regular12w500()),
            ],
          ),
        );
      },
    );
  }
}
