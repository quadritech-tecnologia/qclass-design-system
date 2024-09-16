import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';
import 'web_scroll_behavior.dart';

void main() {
  runApp(const MainApp());
}

@widgetbook.App()
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var themeMode = AppThemes.createLightTheme();

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        ThemeAddon<ThemeData>(
          themes: [
            WidgetbookTheme(
              name: 'Dark',
              data: AppThemes.createDarkTheme(),
            ),
            WidgetbookTheme(
              name: 'Light',
              data: AppThemes.createLightTheme(),
            ),
          ],
          themeBuilder: (context, theme, child) {
            themeMode = theme;

            return child;
          },
        ),
        DeviceFrameAddon(devices: Devices.ios.all),
        InspectorAddon(),
        GridAddon(100),
        AlignmentAddon(),
        ZoomAddon(),
      ],
      appBuilder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QClass Deisgn System',
        builder: Asuka.builder,
        theme: themeMode,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'QClass v3 - Widgetbook',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.surface,
              ),
            ),
            centerTitle: true,
          ),
          body: child,
        ),
        scrollBehavior: WebScrollBehavior(),
      ),
    );
  }
}
