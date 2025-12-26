import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class ChatHistoryAvatar extends StatelessWidget {
  final String userName;
  const ChatHistoryAvatar({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.r,
      backgroundColor: AppColors.bubbleGreen,
      child: Text(
        userName.getInitial,
        style: AppFonts.regular14w600().copyWith(color: AppColors.whiteTxt),
      ),
    );
  }
}
