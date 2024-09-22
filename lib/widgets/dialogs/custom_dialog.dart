import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        Border,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Flexible,
        GestureDetector,
        Icon,
        Icons,
        MainAxisAlignment,
        MainAxisSize,
        Material,
        MaterialLocalizations,
        Navigator,
        Padding,
        SafeArea,
        StatelessWidget,
        Text,
        TextAlign,
        Widget,
        showGeneralDialog;

enum MessageType { error, warning, success }

class CustomDialog {
  static Future<bool> _defaultConfig(
    BuildContext context,
    Widget child, {
    bool showClose = false,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) async {
    return await showGeneralDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 250),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, animation, secondaryAnimation) {
        return _CustomDialog(
          backgroundColor: backgroundColor,
          showClose: showClose,
          padding: padding,
          child: child,
        );
      },
    ).then((value) => value == true);
  }

  static Future<bool> show(
    BuildContext context,
    Widget child, {
    bool showClose = false,
    EdgeInsets? padding,
  }) async {
    return await _defaultConfig(context, child,
        showClose: showClose, padding: padding);
  }

  static Future<bool> showDefaultMessage({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onButtonPress,
    String buttonText = 'Voltar',
    bool showClose = false,
    EdgeInsets? padding,
    Color? backgroundColor,
    MessageType typeMessage = MessageType.error,
  }) async {
    return _defaultConfig(
      context,
      showClose: showClose,
      backgroundColor: backgroundColor,
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomImage(
            svgAsset: switch (typeMessage) {
              MessageType.error => CustomAssets.error,
              MessageType.success => CustomAssets.success,
              MessageType.warning => CustomAssets.warning,
            },
          ),
          Spacing.lg.vertical,
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Spacing.md.vertical,
          Text(
            message,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Spacing.xl.vertical,
          CustomButton.text(
            text: buttonText,
            type: ButtonType.background,
            backgroundColor: switch (typeMessage) {
              MessageType.error => context.colorScheme.error,
              MessageType.success => AppColorsBase.success,
              MessageType.warning => AppColorsBase.warning2,
            },
            onPressed: onButtonPress ?? () => Navigator.of(context).pop(),
          )
        ],
      ),
    ).then((value) => value == true);
  }

  static Future<bool> showNoConnectiontMessage({
    required BuildContext context,
    bool showClose = false,
    Color? backgroundColor,
    String buttonText = 'Entendi',
    EdgeInsets? padding,
    VoidCallback? onButtonPress,
  }) async {
    return _defaultConfig(
      context,
      showClose: showClose,
      backgroundColor: backgroundColor,
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomImage(svgAsset: CustomAssets.connectionError),
          Spacing.lg.vertical,
          Text(
            'Oops, sem conexão',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Spacing.md.vertical,
          Text(
            'Você está off-line. Verifique sua conexão',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Spacing.xl.vertical,
          CustomButton.text(
            text: buttonText,
            type: ButtonType.background,
            backgroundColor: context.colorScheme.tertiary,
            onPressed: onButtonPress ?? () => Navigator.of(context).pop(),
          )
        ],
      ),
    ).then((value) => value == true);
  }
}

class _CustomDialog extends StatelessWidget {
  const _CustomDialog({
    required this.showClose,
    required this.child,
    this.padding,
    this.backgroundColor,
  });

  final bool showClose;
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppThemeBase.borderRadiusMD,
                  border: Border.all(
                    color: context.colorScheme.surface,
                    width: 2,
                  ),
                  color: backgroundColor ?? Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: -5,
                      color: context.colorScheme.surface.withOpacity(0.5),
                    ),
                  ],
                ),
                padding: padding ?? EdgeInsets.all(const Spacing(3).value),
                margin: EdgeInsets.all(const Spacing(3).value),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showClose)
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(false),
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: const Spacing(2).value,
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    Flexible(child: child),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
