import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';
import 'package:my_sivi_chat/home_screen/chat_history/domain/entity/chat_history_entity.dart';

import '../../../../core/utils/app_colors.dart';

class ChatHistoryCard extends StatelessWidget {
  final ChatHistoryEntity chatHistory;
  const ChatHistoryCard({super.key, required this.chatHistory});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.btmDisable.withValues(alpha: 0.3),
      onTap: () {},
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: AppColors.bubbleGreen,
        child: Text(
          chatHistory.userName.getInitial,
          style: AppFonts.regular14w600().copyWith(color: AppColors.whiteTxt),
        ),
      ),

      title: Text(
        chatHistory.userName,
        style: AppFonts.regular14w600().copyWith(color: AppColors.black),
      ),

      subtitle: Text(
        chatHistory.lastMsg,
        style: AppFonts.regular12w500().copyWith(
          color: AppColors.fieldLblTxtColor,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chatHistory.lastSeen,
            style: AppFonts.regular12w400().copyWith(
              color: AppColors.btmDisable,
            ),
          ),
          3.h.heightBox,
          if (chatHistory.unOpenedMsgCount > 0)
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              height: 15.h,
              width: 18.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bubbleBlue,
              ),
              child: Text(
                chatHistory.unOpenedMsgCount.toString(),
                style: AppFonts.regular12w400().copyWith(
                  color: AppColors.whiteTxt,
                ),
              ).center,
            ),
        ],
      ),
    );
  }
}
