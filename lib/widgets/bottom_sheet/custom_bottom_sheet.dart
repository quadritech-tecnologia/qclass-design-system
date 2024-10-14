import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    VoidCallback? onTapDismissible,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      elevation: 0.0,
      isScrollControlled: true,
      enableDrag: isDismissible,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PopScope(
          canPop: isDismissible,
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: isDismissible ? onTapDismissible : null,
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),
              _ContentBottomSheet(body: child),
            ],
          ),
        );
      },
    );
  }
}

/// Componente de bottomsheet
class _ContentBottomSheet extends StatelessWidget {
  const _ContentBottomSheet({required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.dialogBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Spacing.sm.value),
            ),
          ),

          /// Esse [GestureDetector] impede que o [GestureDetector] do pai seja acionado
          child: GestureDetector(
            onTap: () {},
            child: body,
          ),
        ),
      ),
    );
  }
}
