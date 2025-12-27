import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';
import 'package:my_sivi_chat/core/routes/route_names.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';
import 'package:my_sivi_chat/home_screen/user_tab/presentation/widget/user_msg_avatar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entity/user_msg_entity.dart';

class UserMessageCard extends StatelessWidget {
  final UserMsgEntity user;
  const UserMessageCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.btmDisable.withValues(alpha: 0.3),
      onTap: () {
        context.pushNamed(
          RouteNames.chatScreen,
          extra: [user.userName, user.lastSeen],
        );
      },
      leading: UserMsgAvatar(userName: user.userName, isOnline: user.isOnline),

      title: Text(
        user.userName,
        style: AppFonts.regular14w600().copyWith(color: AppColors.black),
      ),

      subtitle: Text(
        user.lastSeen.toLastSeen(),
        style: AppFonts.regular12w400().copyWith(color: AppColors.btmDisable),
      ),
    );
  }
}
