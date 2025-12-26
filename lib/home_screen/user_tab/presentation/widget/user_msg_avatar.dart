import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class UserMsgAvatar extends StatelessWidget {
  final String userName;
  final bool isOnline;
  const UserMsgAvatar({
    super.key,
    required this.userName,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 36.r,
          height: 36.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.kPrimaryColor, AppColors.purpleGradiant],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            userName.getInitial,
            style: AppFonts.regular14w600().copyWith(color: AppColors.whiteTxt),
          ),
        ),

        if (isOnline) _buildOnlineDot(),
      ],
    );
  }

  Widget _buildOnlineDot() {
    return Positioned(
      right: -1,
      bottom: -1,
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
