import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/chat_screen/presentation/Cubit/cubit/translation_cubit.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';

import '../../../core/utils/app_colors.dart';
import '../../../home_screen/user_tab/presentation/widget/user_msg_avatar.dart';

class ChatMessageBubble extends StatefulWidget {
  final String message;
  final String time;
  final bool isSender;
  final String userInitial;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
    required this.userInitial,
  });

  @override
  State<ChatMessageBubble> createState() => _ChatMessageBubbleState();
}

class _ChatMessageBubbleState extends State<ChatMessageBubble> {
  bool isTranslating = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: widget.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!widget.isSender)
            UserMsgAvatar(userName: widget.userInitial, isOnline: false),

          if (!widget.isSender) 8.w.widthBox,

          //message bubble
          _buildChatBubble(context),

          if (widget.isSender) 8.w.widthBox,

          if (widget.isSender) _buildSenderAvatar(),
        ],
      ),
    );
  }

  _buildSenderAvatar() {
    return Container(
      width: 36.r,
      height: 36.r,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [AppColors.pinkAvatar, AppColors.purpleGradiant],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        "Y",
        style: AppFonts.regular14w600().copyWith(color: AppColors.whiteTxt),
      ),
    );
  }

  _buildChatBubble(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.isSender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: () async {
            if (!isTranslating) {
              context.read<TranslationCubit>().translateLatinToEnglish(
                widget.message,
              );
            }
          },
          child: Container(
            constraints: const BoxConstraints(maxWidth: 260),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: widget.isSender
                  ? AppColors.bubbleBlue
                  : AppColors.bubbleGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.isSender ? 16 : 6),
                topRight: Radius.circular(widget.isSender ? 6 : 16),
                bottomLeft: const Radius.circular(16),
                bottomRight: const Radius.circular(16),
              ),
            ),
            child: Text(
              widget.message,
              style: AppFonts.regular12w500().copyWith(
                color: widget.isSender ? AppColors.whiteTxt : AppColors.black,
              ),
            ),
          ),
        ),

        4.h.heightBox,

        //time stamp
        Text(
          widget.time,
          style: AppFonts.regular12w500().copyWith(
            color: AppColors.fieldLblTxtColor,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
