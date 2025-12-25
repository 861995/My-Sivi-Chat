import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

// if there is any crash in the app this screens will be visible and that helps user to Close the app. navigating to home screens from here is not possible
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.redAccent,
              size: 60.sp,
            ),
            16.h.heightBox,
            Text(
              "Oops! Something went wrong",
              style: AppFonts.regular18w600().copyWith(color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            8.h.heightBox,
            Text(
              "We’re working to fix this issue. "
              "Please try again or return to the home screens.",
              style: AppFonts.regular14w400().copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            20.h.heightBox,
            ElevatedButton.icon(
              onPressed: _exitApp,
              icon: const Icon(Icons.exit_to_app),
              label: const Text("Exit App"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ).withPadding(15.r.allPadding),
      ).withPadding(20.r.allPadding).center,
    );
  }

  static void _exitApp() {
    if (Platform.isAndroid) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
