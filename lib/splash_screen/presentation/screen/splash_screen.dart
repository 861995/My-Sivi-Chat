import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:my_sivi_chat/core/routes/route_names.dart';
import 'package:my_sivi_chat/core/utils/app_fonts.dart';
import 'package:my_sivi_chat/core/utils/app_strings.dart';

import '../../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.goNamed(RouteNames.homeScreen);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTxt,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/launcher_icon.png").center,
          10.h.heightBox,
          Text(
            AppConstantString.appName,
            style: AppFonts.regular20w600().copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
