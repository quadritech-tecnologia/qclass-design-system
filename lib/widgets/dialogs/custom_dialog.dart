import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        Border,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Colors,
        Column,
        Container,
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
        Widget,
        showGeneralDialog;

class CustomDialog {
  static Future<bool> show(
    BuildContext context,
    Widget child, {
    bool showClose = false,
    EdgeInsets? padding,
  }) async {
    return await showGeneralDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 250),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, animation, secondaryAnimation) {
        return _CustomDialog(
          showClose: showClose,
          padding: padding,
          child: child,
        );
      },
    ).then((value) => value == true);
  }
}

class _CustomDialog extends StatelessWidget {
  final bool showClose;
  final Widget child;
  final EdgeInsets? padding;

  const _CustomDialog({
    required this.showClose,
    required this.child,
    this.padding,
  });

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
                  color: context.colorScheme.surface,
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
                              color: context.textTheme.bodyMedium?.color,
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
