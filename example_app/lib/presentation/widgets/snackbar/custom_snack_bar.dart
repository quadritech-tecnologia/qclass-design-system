import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'snackbar', type: CustomSnackBar)
Widget showSuccessSnackBar(BuildContext context) {
  return Scaffold(
      body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton.text(
            text: 'SnackBar de sucesso',
            isLoading: false,
            onPressed: () {
              CustomSnackBar.showMessage(
                context: context,
                title: 'Mensagem de sucesso!.',
              );
            },
          ),
          Spacing.md.vertical,
          CustomButton.text(
            text: 'SnackBar de error',
            isLoading: false,
            onPressed: () {
              CustomSnackBar.showMessage(
                context: context,
                isError: true,
                title: 'Mensagem de error',
              );
            },
          ),
        ],
      ),
    ),
  ));
}
