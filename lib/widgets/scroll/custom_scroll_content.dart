import 'package:flutter/material.dart';

import '../loading/custom_refresh_indicator.dart';

class CustomScrollContent extends StatelessWidget {
  const CustomScrollContent({
    super.key,
    this.onRefresh,
    required this.child,
    this.reverse = false,
    this.expanded = false,
    this.scrollController,
    this.alwaysScrollable = false,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
  });

  final Widget child;
  final bool reverse;
  final bool expanded;
  final EdgeInsets padding;
  final Axis scrollDirection;
  final bool alwaysScrollable;
  final Future Function()? onRefresh;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final scroll = SingleChildScrollView(
      physics: BouncingScrollPhysics(
        parent: alwaysScrollable ? const AlwaysScrollableScrollPhysics() : null,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      scrollDirection: scrollDirection,
      controller: scrollController,
      reverse: reverse,
      padding: padding,
      child: child,
    );
    if (expanded) {
      switch (scrollDirection) {
        case Axis.vertical:
          if (onRefresh != null) {
            return CustomRefreshIndicator(
              onRefresh: onRefresh!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Expanded(child: scroll)],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Expanded(child: scroll)],
          );
        default:
          return scroll;
      }
    } else if (onRefresh != null) {
      return CustomRefreshIndicator(onRefresh: onRefresh!, child: scroll);
    }
    return scroll;
  }
}
