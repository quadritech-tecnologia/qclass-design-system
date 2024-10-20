import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        ClipRRect,
        Color,
        Divider,
        StatelessWidget,
        Widget;

/// Componente de divider feito de acordo com o DesignSystem
class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: const Divider(color: Color(0xFFE9E9E4), height: 1));
  }
}
