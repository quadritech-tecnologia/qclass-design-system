import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'CustomDivider', type: CustomDivider)
Widget customDivider(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.sm.value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(color: Colors.red, width: 200, height: 100),
          const CustomDivider(),
          Container(color: Colors.red, width: 200, height: 100),
        ],
      ),
    ),
  );
}
