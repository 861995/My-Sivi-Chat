import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entity/user_msg_entity.dart';

class UserMessageCard extends StatelessWidget {
  final UserMsgEntity user;
  const UserMessageCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.btmDisable.withValues(alpha: 0.3),
      onTap: () {},
      leading: Stack(
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
              user.userName.getInitial,
              style: AppFonts.regular14w600().copyWith(
                color: AppColors.whiteTxt,
              ),
            ),
          ),

          if (user.isOnline) _buildOnlineDot(),
        ],
      ),

      title: Text(
        user.userName,
        style: AppFonts.regular14w600().copyWith(color: AppColors.black),
      ),

      subtitle: Text(
        user.lastSeen,
        style: AppFonts.regular12w400().copyWith(color: AppColors.btmDisable),
      ),
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
