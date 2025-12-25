import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

/// BuildContext Extensions
extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenHeight => screenSize.height;

  double get screenWidth => screenSize.width;

  bool get isMobile => screenWidth < 600;

  void hideKeyboard() => FocusScope.of(this).unfocus();

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  double get textScaleSize => MediaQuery.of(
    this,
  ).textScaler.clamp(minScaleFactor: 1, maxScaleFactor: 1.4).scale(1);
}

/// Padding Extensions
extension PaddingExtension on num {
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());

  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());

  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());

  SizedBox get heightBox => SizedBox(height: toDouble());

  SizedBox get widthBox => SizedBox(width: toDouble());
}

/// Widget Extensions
extension WidgetExtensions on Widget {
  Widget withPadding([EdgeInsets padding = const EdgeInsets.all(8)]) =>
      Padding(padding: padding, child: this);

  Widget get center => Center(child: this);

  Widget get repaintBoundary => RepaintBoundary(child: this);

  Widget withTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  Widget withExpanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget withFlexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  Widget withSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width, child: this);

  Widget refreshIndicator({required VoidCallback onTap}) => RefreshIndicator(
    backgroundColor: AppColors.whiteTxt,
    color: AppColors.kPrimaryColor,

    onRefresh: () async {
      onTap();
    },
    child: this,
  );

  Widget customSystemNavigation() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.whiteTxt,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: this,
    );
  }
}
