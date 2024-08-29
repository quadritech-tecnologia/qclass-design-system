import 'package:design_system_qclass/design_system_qclass.dart'
    show BuildContextExt;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Text, TextOverflow, Widget;

class InputLabel extends StatelessWidget {
  final String label;
  final bool hasError;
  const InputLabel({
    super.key,
    required this.label,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyMedium?.copyWith(
        color: context.colorScheme.onSurface,
      ),
    );
  }
}
