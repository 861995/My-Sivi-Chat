import 'package:flutter/material.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

// global key for the snack bar
final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

class UiUtility {
  static bool isDialogShowing = false;

  static void showToast({
    required String message,
    bool? isSuccess,
    bool? isFailure,
  }) {
    final messengerState = messengerKey.currentState;

    if (messengerState == null) return;

    Color backgroundColor;
    IconData icon;

    if (isSuccess == true) {
      backgroundColor = AppColors.snackBarSuccess;
      icon = Icons.check_circle_outline;
    } else if (isFailure == true) {
      backgroundColor = AppColors.snackBarFailure;
      icon = Icons.error_outline;
    } else {
      backgroundColor = AppColors.fieldLblTxtColor;
      icon = Icons.info_outline;
    }
    messengerState.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: AppColors.whiteTxt, size: 20),
            const SizedBox(width: 12),
            Text(message, style: AppFonts.regular14w500()).withExpanded(),
          ],
        ),

        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
