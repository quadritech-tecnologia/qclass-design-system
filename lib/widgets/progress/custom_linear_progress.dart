import 'package:design_system_qclass/design_system_qclass.dart'
    show AppColorsBase, Spacing, SpacingExt;
import 'package:flutter/material.dart';

/// Componente de linear Progress com animação de cor
class CustomLinearProgress extends StatefulWidget {
  const CustomLinearProgress({
    super.key,
    required this.fullValue,
    required this.currentValue,
    required this.description,
    this.height = 8.0,
    this.backgroundColor,
    this.borderRadius,
  });

  final String description;
  final double fullValue;
  final double currentValue;
  final double height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  CustomLinearProgressState createState() => CustomLinearProgressState();
}

class CustomLinearProgressState extends State<CustomLinearProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.currentValue / widget.fullValue,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _colorAnimation = ColorTween(
      begin: AppColorsBase.primary,
      end: widget.currentValue >= widget.fullValue
          ? AppColorsBase.success
          : AppColorsBase.primary,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CustomLinearProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentValue != widget.currentValue) {
      _controller.reset();
      _progressAnimation = Tween<double>(
        begin: oldWidget.currentValue / oldWidget.fullValue,
        end: widget.currentValue / widget.fullValue,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linear),
      );

      // Atualizar a cor quando o progresso chega a 100%
      _colorAnimation = ColorTween(
        begin: AppColorsBase.primary,
        end: widget.currentValue == widget.fullValue
            ? AppColorsBase.success
            : AppColorsBase.primary,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.description, style: _text.bodyMedium),
            Text(
              '${((100 * widget.currentValue) / widget.fullValue).toInt()}%',
            ),
          ],
        ),
        Spacing.xxs.vertical,
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                _colorScheme.onSurface.withOpacity(.14),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _progressAnimation.value,
                  child: Container(color: _colorAnimation.value),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  ThemeData get _theme => Theme.of(context);
  TextTheme get _text => _theme.textTheme;
  ColorScheme get _colorScheme => _theme.colorScheme;
}
