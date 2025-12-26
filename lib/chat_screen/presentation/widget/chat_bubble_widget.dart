import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';

import '../../../core/utils/app_colors.dart';
import '../../../home_screen/user_tab/presentation/widget/user_msg_avatar.dart';

class ChatMessageBubble extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isSender) UserMsgAvatar(userName: userInitial, isOnline: false),

          if (!isSender) 8.w.widthBox,

          Column(
            crossAxisAlignment: isSender
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 260),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSender ? AppColors.bubbleBlue : AppColors.bubbleGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: isSender
                        ? const Radius.circular(16)
                        : Radius.zero,
                    bottomRight: isSender
                        ? Radius.zero
                        : const Radius.circular(16),
                  ),
                ),
                child: Text(
                  message,
                  style: AppFonts.regular12w500().copyWith(
                    color: isSender ? AppColors.whiteTxt : AppColors.black,
                  ),
                ),
              ),

              4.h.heightBox,

              Text(
                time,
                style: AppFonts.regular12w500().copyWith(
                  color: AppColors.fieldLblTxtColor,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),

          if (isSender) 8.w.widthBox,

          if (isSender) _buildSenderAvatar(),
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
}
