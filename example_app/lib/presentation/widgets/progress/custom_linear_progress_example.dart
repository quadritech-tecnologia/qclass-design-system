import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'LinearProgress', type: CustomLinearProgress)
Widget customLinearProgress(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.sm.value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const CustomLinearProgress(
            currentValue: 10,
            fullValue: 10,
            description: 'Enviando aulas',
          ),
          Spacing.md.vertical,
          const CustomLinearProgress(
            description: 'Baixando novos dados',
            currentValue: 3,
            fullValue: 10,
          ),
        ],
      ),
    ),
  );
}
