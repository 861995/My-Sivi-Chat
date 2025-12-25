import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:my_sivi_chat/core/utils/ui_utills.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import '../routes/route_names.dart';
import '../utils/app_strings.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Widget child;

  const CustomBottomNavigationBar({required this.child, super.key});

  static final tabs = [
    RouteNames.homeScreen,
    RouteNames.otherScreen,
    RouteNames.settingScreen,
  ];
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();

  static Widget yesButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        minimumSize: Size(35.w, 30.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      ),
      onPressed: () => context.pop(true),
      child: Text(
        AppConstantString.yes,
        style: AppFonts.regular14w500().copyWith(color: AppColors.whiteTxt),
      ),
    );
  }

  static Widget noButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.kPrimaryColor, width: 1.2),
        minimumSize: Size(35.w, 30.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      ),
      onPressed: () => context.pop(false),
      child: Text(
        AppConstantString.no,
        style: AppFonts.regular14w500().copyWith(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    final currentIndex = CustomBottomNavigationBar.tabs.indexOf(
      GoRouterState.of(context).uri.toString(),
    );
    final homeIndex = CustomBottomNavigationBar.tabs.indexOf(
      RouteNames.homeScreen,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;

        if (currentIndex == homeIndex) {
          final now = DateTime.now();

          if (_lastBackPressed == null ||
              now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
            _lastBackPressed = now;

            UiUtility.showToast(message: "Press again to Exit");
          } else {
            SystemNavigator.pop(animated: true);
          }
        } else {
          context.go(CustomBottomNavigationBar.tabs[homeIndex]);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteTxt,
        body: widget.child,
        bottomNavigationBar: SafeArea(
          bottom: true,
          top: false,
          left: false,
          right: false,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //home
                    _buildNavBarItem(
                      icon: Icons.chat_bubble_outlined,
                      label: AppConstantString.home,
                      isSelected: currentIndex == 0,
                      onTap: () =>
                          context.go(CustomBottomNavigationBar.tabs[0]),
                    ).withExpanded(),
                    //other
                    _buildNavBarItem(
                      icon: Icons.local_offer_outlined,
                      label: AppConstantString.other,
                      isSelected: currentIndex == 1,
                      onTap: () =>
                          context.go(CustomBottomNavigationBar.tabs[1]),
                    ).withExpanded(),

                    //setting
                    _buildNavBarItem(
                      icon: Icons.settings,
                      label: AppConstantString.setting,
                      isSelected: currentIndex == 2,
                      onTap: () =>
                          context.go(CustomBottomNavigationBar.tabs[2]),
                    ).withExpanded(),
                  ],
                ).withSizedBox(
                  width: double.infinity,
                  height: kBottomNavigationBarHeight,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          4.h.heightBox,
          Icon(
            icon,
            color: isSelected ? AppColors.kPrimaryColor : AppColors.btmDisable,
          ),
          2.h.heightBox,
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            label,
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected
                  ? AppColors.kPrimaryColor
                  : AppColors.txtFieldBorderColor,
            ),
          ).repaintBoundary,
        ],
      ),
    );
  }
}
