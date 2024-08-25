import 'package:flutter/material.dart';

///Esse widget É para aplicar em Columns com Expanded ou Flexible
///e tornar a Column 'scrolavel' e também pega toda tela disponível
class FullSizeScrollableWidget extends StatelessWidget {
  const FullSizeScrollableWidget({
    super.key,
    this.child,
    this.physics,
    this.padding,
  });

  final Widget? child;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: physics,
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(child: child),
          ),
        );
      },
    );
  }
}
