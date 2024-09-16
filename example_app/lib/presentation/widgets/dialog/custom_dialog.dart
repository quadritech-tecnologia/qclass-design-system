import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'dialog', type: CustomDialog)
Widget showSuccessSnackBar(BuildContext context) {
  Widget defaultBody() {
    return Column(
      children: [
        Text(
          'Exemplo de título',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        Spacing.md.vertical,
        CustomButton.text(
          text: 'Fechar',
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  return Scaffold(
      body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton.text(
            text: 'Mostrar dialog',
            isLoading: false,
            onPressed: () {
              CustomDialog.show(
                context,
                defaultBody(),
                showClose: true,
              );
            },
          ),
        ],
      ),
    ),
  ));
}
