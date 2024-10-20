import 'dart:async';

import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ShowDatePicker', type: CustomSelectDate)
Widget showDatePicker(BuildContext context) {
  final controller = StreamController<DateTime>();

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Center(
        child: CustomButton.text(
          text: 'Mostrar Calendário',
          backgroundColor: context.colorScheme.primary,
          onPressed: () async {
            await CustomSelectDate.selectCalendarDate(context: context)
                .then((value) {
              controller.add(value);
            });
          },
        ),
      ),
      Spacing.xxl.vertical,
      StreamBuilder<DateTime?>(
          initialData: null,
          stream: controller.stream,
          builder: (context, snapshot) {
            return Text(
              'Data selecionada: ${(snapshot.data != null) ? snapshot.data!.toIso8601String() : 'Nenhuma data selecionada'}',
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall,
            );
          })
    ],
  );
}
