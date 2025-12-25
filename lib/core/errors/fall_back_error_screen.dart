import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

// if there is any routing issue then this screens will be visible and that helps user to navigate to home screens
class FallBackErrorScreen extends StatelessWidget {
  const FallBackErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                  style: AppFonts.regular18w600().copyWith(
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                8.h.heightBox,
                Text(
                  "Click below navigate to Home Screen",
                  style: AppFonts.regular14w400().copyWith(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                20.h.heightBox,
                ElevatedButton.icon(
                  onPressed: () {
                    _navigateToHome(context);
                  },
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
      },
    );
  }

  void _navigateToHome(BuildContext context) {
    // context.goNamed(RouteNames.homeScreen);
  }
}
