/// A service class that helps manage screen size breakpoints for responsive design.
///
/// The `ScreenManager` class provides constants and methods to determine whether the current
/// screen width corresponds to a desktop, tablet, or mobile device. This is useful for
/// implementing responsive design in Flutter applications.
class ScreenManager {
  /// The maximum width considered for desktop devices.
  static const double maxWidthDesktop = 1920;

  /// The minimum width considered for desktop devices.
  static const double minWidthDesktop = 1025;

  /// The maximum width considered for tablet devices.
  static const double maxWidthTablet = 1024;

  /// The minimum width considered for tablet devices.
  static const double minWidthTablet = 430;

  /// The maximum width considered for mobile devices.
  static const double maxWidthMobile = 430;

  /// The minimum width considered for mobile devices.
  static const double minWidthMobile = 320;

  /// Checks if the given [width] corresponds to a desktop device.
  ///
  /// Returns `true` if the [width] is greater than or equal to [minWidthDesktop],
  /// indicating that the device should be considered a desktop.
  ///
  /// ```dart
  /// bool isDesktop = ScreenManager.isDesktop(screenWidth);
  /// ```
  static bool isDesktop(double width) {
    return width >= minWidthDesktop;
  }

  /// Checks if the given [width] corresponds to a tablet device.
  ///
  /// Returns `true` if the [width] is between [minWidthTablet] and [maxWidthTablet]
  /// inclusive, indicating that the device should be considered a tablet.
  ///
  /// ```dart
  /// bool isTablet = ScreenManager.isTablet(screenWidth);
  /// ```
  static bool isTablet(double width) {
    return width >= minWidthTablet && width <= maxWidthTablet;
  }

  /// Checks if the given [width] corresponds to a mobile device.
  ///
  /// Returns `true` if the [width] is between [minWidthMobile] and [maxWidthMobile]
  /// inclusive, indicating that the device should be considered a mobile.
  ///
  /// ```dart
  /// bool isMobile = ScreenManager.isMobile(screenWidth);
  /// ```
  static bool isMobile(double width) {
    return width >= minWidthMobile && width <= maxWidthMobile;
  }
}
