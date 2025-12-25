import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CommonTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;

  const CommonTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.btmDisable.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: AnimatedBuilder(
        animation: tabController,
        builder: (context, _) {
          return TabBar(
            controller: tabController,
            tabAlignment: TabAlignment.center,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              color: AppColors.whiteTxt,
              borderRadius: BorderRadius.circular(100),
            ),
            labelPadding: EdgeInsets.zero,

            tabs: List.generate(tabs.length, (index) {
              final bool isSelected = tabController.index == index;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                decoration: isSelected
                    ? BoxDecoration(
                        color: AppColors.whiteTxt,
                        borderRadius: BorderRadius.circular(100),
                      )
                    : const BoxDecoration(),
                child: Text(
                  tabs[index],
                  style: isSelected
                      ? AppFonts.regular12w600().copyWith(
                          color: AppColors.black,
                        )
                      : AppFonts.regular12w500().copyWith(
                          color: AppColors.fieldLblTxtColor,
                        ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
