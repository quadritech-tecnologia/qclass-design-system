import 'package:flutter/material.dart';

import 'screen_responsive.dart';

/// A widget that displays different layouts based on the screen size.
/// The [desktopLayout] will be displayed when the screen width is greater than 1024.
/// The [tabletLayout] will be displayed when the screen width is between 376 and 1024.
/// The [mobileLayout] will be displayed when the screen width is between 320 and 414.
/// The [screenWidth] is the width of the screen.
/// If the screen width is not supported, a text will be displayed.
/// The [desktopLayout], [tabletLayout], and [mobileLayout] are required.
/// The [screenWidth] is required.
///
/// Example:
/// ```dart
/// ScreenResponsiveWidget(
///   desktopLayout: DesktopLayout(),
///   tabletLayout: TabletLayout(),
///   mobileLayout: MobileLayout(),
///   screenWidth: MediaQuery.sizeOf(context).width,
/// )
/// ```
///
class ScreenResponsiveWidget extends StatelessWidget {
  final Widget desktopLayout;
  final Widget tabletLayout;
  final Widget mobileLayout;
  final double screenWidth;

  const ScreenResponsiveWidget({
    super.key,
    required this.desktopLayout,
    required this.tabletLayout,
    required this.mobileLayout,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (ScreenManager.isDesktop(screenWidth)) {
      return desktopLayout;
    } else if (ScreenManager.isTablet(screenWidth)) {
      return tabletLayout;
    } else if (ScreenManager.isMobile(screenWidth)) {
      return mobileLayout;
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Screen size not supported'),
        ),
      );
    }
  }
}
