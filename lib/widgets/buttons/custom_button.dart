import 'package:flutter/material.dart';

import '../../design_system_qclass.dart';

enum ButtonType { primary, secondary, tertiary, background, noShape }

enum ButtonHeightType { normal, small }

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isEnabled = true,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
    this.isSafe = false,
    this.type = ButtonType.primary,
    this.heightType = ButtonHeightType.normal,
  });

  final ButtonType type;
  final ButtonHeightType heightType;
  final Function()? onPressed;
  final Widget child;
  final bool isEnabled;
  final bool isLoading;
  final bool isSafe;
  final EdgeInsets padding;

  @override
  State<CustomButton> createState() => _CustomButtonState();

  static Widget iconValue(
    IconData iconData, {
    ButtonType type = ButtonType.primary,
  }) {
    return Builder(
      builder: (context) {
        late final Color color;
        switch (type) {
          case ButtonType.background:
            color = context.colorScheme.primary;
            break;
          case ButtonType.noShape:
            color = context.colorScheme.primary;
            break;
          default:
            color = context.isDarkMode
                ? context.colorScheme.onSurface
                : context.colorScheme.surface;
            break;
        }
        return Icon(
          iconData,
          size: AppFontSize.iconButton.value,
          color: color,
        );
      },
    );
  }

  static Widget textValue(
    String text, {
    ButtonType type = ButtonType.primary,
    ButtonHeightType heightType = ButtonHeightType.normal,
  }) {
    return Builder(
      builder: (context) {
        late final Color color;
        late final double? fontSize;
        switch (type) {
          case ButtonType.background:
            color = context.colorScheme.primary;
            break;
          case ButtonType.noShape:
            color = context.colorScheme.primary;
            break;
          default:
            color = context.isDarkMode
                ? context.colorScheme.onSurface
                : context.colorScheme.surface;
            break;
        }
        switch (heightType) {
          case ButtonHeightType.normal:
            fontSize = context.textTheme.bodyMedium?.fontSize;
            break;
          case ButtonHeightType.small:
            fontSize = context.textTheme.bodySmall?.fontSize;
            break;
        }
        return CustomTooltip(
          message: text,
          child: Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: context.textTheme.fontWeightBold,
              fontSize: fontSize,
              color: color,
            ),
          ),
        );
      },
    );
  }

  factory CustomButton.text({
    ButtonType type = ButtonType.primary,
    ButtonHeightType heightType = ButtonHeightType.normal,
    Function()? onPressed,
    required String text,
    bool isEnabled = true,
    bool isLoading = false,
    bool isSafe = false,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return CustomButton(
      type: type,
      onPressed: onPressed,
      heightType: heightType,
      isEnabled: isEnabled,
      isLoading: isLoading,
      padding: padding,
      child: textValue(text, type: type),
    );
  }
  factory CustomButton.icon({
    ButtonType type = ButtonType.primary,
    ButtonHeightType heightType = ButtonHeightType.normal,
    Function()? onPressed,
    required IconData icon,
    bool isEnabled = true,
    bool isLoading = false,
    bool isSafe = false,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return CustomButton(
      type: type,
      onPressed: onPressed,
      heightType: heightType,
      isEnabled: isEnabled,
      isLoading: isLoading,
      padding: padding,
      child: iconValue(icon, type: type),
    );
  }
  factory CustomButton.iconText({
    ButtonType type = ButtonType.primary,
    ButtonHeightType heightType = ButtonHeightType.normal,
    Function()? onPressed,
    required IconData icon,
    required String text,
    bool isEnabled = true,
    bool isLoading = false,
    bool isSafe = false,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return CustomButton(
      type: type,
      onPressed: onPressed,
      heightType: heightType,
      isEnabled: isEnabled,
      isLoading: isLoading,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          iconValue(icon, type: type),
          const SizedBox(width: 8),
          textValue(text, type: type),
        ],
      ),
    );
  }
}

class _CustomButtonState extends State<CustomButton> {
  Size get minimumSize {
    switch (widget.heightType) {
      case ButtonHeightType.normal:
        return Size(
          AppThemeBase.buttonHeightMD,
          AppThemeBase.buttonHeightMD,
        );
      case ButtonHeightType.small:
        return Size(
          AppThemeBase.buttonHeightSM,
          AppThemeBase.buttonHeightSM,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !widget.isEnabled ? 0.5 : 1,
      child: AbsorbPointer(
        absorbing: widget.isLoading || !widget.isEnabled,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(_backgroundColor),
            surfaceTintColor: WidgetStateProperty.all(_surfaceTintColor),
            overlayColor: WidgetStateProperty.all(_overlayColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: AppThemeBase.borderRadiusSM,
              ),
            ),
            shadowColor: WidgetStateProperty.all(Colors.transparent),
            minimumSize: WidgetStateProperty.all(minimumSize),
            elevation: WidgetStateProperty.all(0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: WidgetStateProperty.all(widget.padding),
          ),
          child: SafeArea(
            bottom: widget.isSafe,
            top: false,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: const Spacing(1).value,
                vertical: const Spacing(.75).value,
              ),
              constraints: BoxConstraints(minHeight: minimumSize.height),
              alignment: Alignment.center,
              child: widget.isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: AppColorsBase.white,
                        backgroundColor: AppColorsBase.white.withOpacity(.16),
                        strokeCap: StrokeCap.round,
                        strokeWidth: 2.5,
                      ),
                    )
                  : widget.child,
            ),
          ),
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (widget.type) {
      case ButtonType.primary:
        return context.colorScheme.tertiary;
      case ButtonType.secondary:
        return context.colorScheme.secondary;
      case ButtonType.background:
        return Colors.transparent;
      case ButtonType.noShape:
        return Colors.transparent;
      case ButtonType.tertiary:
        return AppColorsBase.success;
    }
  }

  Color get _surfaceTintColor {
    switch (widget.type) {
      case ButtonType.primary:
        return context.colorScheme.tertiary;
      case ButtonType.secondary:
        return context.colorScheme.secondary;
      case ButtonType.background:
        return context.colorScheme.surface;
      case ButtonType.tertiary:
        return AppColorsBase.success;
      case ButtonType.noShape:
        return context.colorScheme.surface;
    }
  }

  Color get _overlayColor {
    switch (widget.type) {
      case ButtonType.primary:
        return AppColorsBase.white.withOpacity(.1);
      case ButtonType.secondary:
        return context.colorScheme.onSecondary.withOpacity(.1);
      case ButtonType.background:
        return context.colorScheme.onSurface.withOpacity(.1);
      case ButtonType.noShape:
        return context.colorScheme.onSurface.withOpacity(.1);
      case ButtonType.tertiary:
        return AppColorsBase.success;
    }
  }
}
