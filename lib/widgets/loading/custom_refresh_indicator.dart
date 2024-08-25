import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        RefreshIndicator,
        RefreshIndicatorTriggerMode,
        StatelessWidget,
        Theme,
        Widget;

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        colorScheme: context.colorScheme.copyWith(
          shadow: Colors.transparent,
        ),
      ),
      child: RefreshIndicator(
        onRefresh: onRefresh,
        edgeOffset: 0,
        strokeWidth: 1,
        displacement: 0,
        color: context.colorScheme.primary,
        backgroundColor: Colors.transparent,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: child,
      ),
    );
  }
}
