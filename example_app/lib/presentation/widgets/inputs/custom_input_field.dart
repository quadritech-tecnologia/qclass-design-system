import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'InputField', type: CustomInputField)
Widget showInputText(BuildContext context) {
  return const CustomInputField(
    hintText: 'Hint Text',
    labelText: 'Label Text',
    prefixIcon: Icon(Icons.search),
    suffixIcon: Icon(Icons.clear),
  );
}
