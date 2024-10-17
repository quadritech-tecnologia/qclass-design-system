import 'package:flutter/material.dart';

import '../../themes/spacing/spacing.dart';
import '../scroll/full_size_scrollable.dart';

/// Esatado de empty para quando não encontrar uma aula
class ClassNotFound extends StatelessWidget {
  const ClassNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return FullSizeScrollableWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 68,
            color: colorScheme.onSurface.withOpacity(.36),
          ),
          Spacing.sm.vertical,
          Text(
            'Nenhuma aula encontrada',
            style: text.bodyLarge,
          ),
        ],
      ),
    );
  }
}
