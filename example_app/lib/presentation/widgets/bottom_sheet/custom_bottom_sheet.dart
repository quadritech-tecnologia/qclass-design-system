import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ShowDatePicker', type: CustomBottomSheet)
Widget showBottomSheet(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Center(
        child: CustomButton.text(
          text: 'Mostrar bottomSheet',
          backgroundColor: context.colorScheme.primary,
          onPressed: () async {
            await CustomBottomSheet.showBottomSheet(
              context: context,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'testando',
                    style: context.textTheme.titleSmall,
                  ),
                  CustomButton.text(
                    text: 'Confrimar',
                    onPressed: () {},
                  )
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
