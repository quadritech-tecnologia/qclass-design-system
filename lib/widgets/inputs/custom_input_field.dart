import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputHeightType { normal, small }

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputFormatters = const [],
    this.initialValue,
    this.labelText = '',
    this.errorText = '',
    this.hintText,
    this.prefix,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validators,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.maxLength,
    this.maxLines = 1,
    this.autofocus = false,
    this.textInputAction,
    this.enabled = true,
    this.labelWidget,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.padding = EdgeInsets.zero,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.readOnly = false,
    this.inputHeightType = InputHeightType.normal,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.focusedBorder,
  });

  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final List<String? Function(String?)>? validators;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String?)? onChanged;
  final String? initialValue;
  final String? labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? prefix;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final int? maxLength;
  final int maxLines;
  final bool autofocus;
  final bool enabled;
  final InputHeightType inputHeightType;
  final bool obscureText;
  final EdgeInsets padding;
  final AutovalidateMode? autovalidateMode;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final InputLabel? labelWidget;
  final FloatingLabelBehavior floatingLabelBehavior;
  final InputBorder? focusedBorder;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  BoxConstraints get boxConstraints {
    switch (widget.inputHeightType) {
      case InputHeightType.normal:
        return BoxConstraints(
          minHeight: AppThemeBase.inputHeightMD,
          minWidth: AppThemeBase.inputHeightMD,
        );
      case InputHeightType.small:
        return BoxConstraints(
          minHeight: AppThemeBase.buttonHeightSM,
          minWidth: AppThemeBase.buttonHeightSM,
        );
    }
  }

  String? _validator(String? input) {
    String? error;
    widget.validators?.forEach((val) {
      if (error == null) {
        error = val(input);
        return;
      }
    });
    return error;
  }

  double get fontSize {
    switch (widget.inputHeightType) {
      case InputHeightType.normal:
        return AppFontSize.bodyLarge.value;
      case InputHeightType.small:
        return AppFontSize.bodySmall.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.labelWidget != null) ...[
            widget.labelWidget!,
            Spacing.xxs.vertical,
          ],
          Opacity(
            opacity: widget.enabled ? 1 : .5,
            child: TextFormField(
              key: widget.key,
              onTap: widget.onTap,
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              readOnly: widget.readOnly,
              maxLength: widget.maxLength,
              focusNode: widget.focusNode,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              initialValue: widget.initialValue,
              inputFormatters: widget.inputFormatters,
              autovalidateMode: widget.autovalidateMode,
              onFieldSubmitted: widget.onFieldSubmitted,
              onEditingComplete: widget.onEditingComplete,
              textCapitalization: widget.textCapitalization,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              style: _textTheme.bodyMedium?.copyWith(
                color: _colorScheme.onSurface
                    .withOpacity(widget.enabled ? 1 : .36),
                fontSize: fontSize,
              ),
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                isDense: false,
                fillColor: widget.enabled
                    ? _colorScheme.onSurface.withOpacity(.08)
                    : _colorScheme.onSurface.withOpacity(.08),
                isCollapsed: true,
                filled: true,
                hintStyle: _textTheme.bodyMedium?.copyWith(
                  color: AppColorsBase.gray3,
                  fontSize: fontSize,
                ),
                labelStyle: _textTheme.titleMedium?.copyWith(
                  color: _colorScheme.onPrimary,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: Spacing.sm.value,
                  vertical: const Spacing(1.5).value,
                ),
                helperStyle: _textTheme.labelSmall,
                prefix: Text(widget.prefix ?? ''),
                suffixIconConstraints: boxConstraints,
                prefixIconConstraints: boxConstraints,
                prefixIcon: widget.prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          right: const Spacing(1.5).value,
                        ),
                        child: widget.prefixIcon,
                      )
                    : null,
                suffixIcon: widget.suffixIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: const Spacing(1.5).value,
                        ),
                        child: widget.suffixIcon,
                      )
                    : null,
                hintText: widget.hintText,
                labelText: widget.labelText,
                errorText: widget.errorText == '' ? null : widget.errorText,
                errorStyle: _textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  color: context.isDarkMode
                      ? AppColorsBase.warning
                      : AppColorsBase.danger,
                ),
                counterText: '',
                errorMaxLines: 2,
                constraints: boxConstraints,
                floatingLabelBehavior: widget.floatingLabelBehavior,
                disabledBorder: _border(Colors.transparent),
                enabledBorder: _border(Colors.transparent),
                focusedBorder: _border(Colors.transparent),
                focusedErrorBorder: _border(
                  context.isDarkMode
                      ? AppColorsBase.warning
                      : AppColorsBase.danger,
                ),
                errorBorder: _border(
                  context.isDarkMode
                      ? AppColorsBase.warning
                      : AppColorsBase.danger,
                ),
                border: _border(Colors.transparent),
                alignLabelWithHint: true,
              ),
              onChanged: widget.onChanged,
              autofocus: widget.autofocus,
              validator: widget.validator ?? _validator,
            ),
          ),
        ],
      ),
    );
  }

  InputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: AppThemeBase.borderRadiusSM,
      borderSide: BorderSide(color: color),
    );
  }

  ColorScheme get _colorScheme => context.colorScheme;
  TextTheme get _textTheme => context.textTheme;
}
