import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'dialog', type: CustomDialog)
Widget showDialogMessage(BuildContext context) {
  Widget defaultBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
              text: 'Mostrar dialog personalizado',
              isLoading: false,
              onPressed: () {
                CustomDialog.show(
                  context,
                  defaultBody(),
                  showClose: true,
                );
              },
            ),
            Spacing.lg.vertical,
            CustomButton.text(
              isSafe: true,
              text: 'Mostrar dialog de error',
              isLoading: false,
              onPressed: () {
                CustomDialog.showDefaultMessage(
                  context: context,
                  backgroundColor: context.colorScheme.surface,
                  title: 'Oops, aconteceu um erro',
                  message: 'Ainda não descobrimos a causa do problema',
                  showClose: true,
                );
              },
            ),
            Spacing.lg.vertical,
            CustomButton.text(
              isSafe: true,
              text: 'Mostrar dialog de alerta',
              isLoading: false,
              onPressed: () {
                CustomDialog.showDefaultMessage(
                  context: context,
                  typeMessage: MessageType.warning,
                  backgroundColor: context.colorScheme.surface,
                  title: 'Atenção, isso é um alerta',
                  message: 'Alerta de exemplo para mostrar como funciona',
                  showClose: true,
                );
              },
            ),
            Spacing.lg.vertical,
            CustomButton.text(
              isSafe: true,
              text: 'Mostrar dialog de sucesso',
              isLoading: false,
              onPressed: () {
                CustomDialog.showDefaultMessage(
                  context: context,
                  typeMessage: MessageType.success,
                  backgroundColor: context.colorScheme.surface,
                  title: 'Concluído com sucesso!',
                  message: 'Alerta de exemplo para mostrar como funciona',
                  showClose: true,
                );
              },
            ),
            Spacing.lg.vertical,
            CustomButton.text(
              isSafe: true,
              text: 'Mostrar dialog de sem conexão com internet',
              isLoading: false,
              onPressed: () {
                CustomDialog.showNoConnectiontMessage(
                  context: context,
                  backgroundColor: context.colorScheme.surface,
                  showClose: true,
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
