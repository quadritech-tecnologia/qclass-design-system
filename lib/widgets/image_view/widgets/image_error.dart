import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        BoxDecoration,
        BuildContext,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Flexible,
        Icon,
        Icons,
        InkWell,
        MainAxisSize,
        Padding,
        RichText,
        State,
        StatefulWidget,
        Text,
        TextSpan,
        Widget;
import 'package:flutter/widgets.dart';

class ImageError extends StatefulWidget {
  const ImageError({super.key, required this.error});

  final String error;

  @override
  State<ImageError> createState() => _ImageErrorState();
}

class _ImageErrorState extends State<ImageError> {
  @override
  Widget build(BuildContext context) {
    final theme = context;

    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {
          CustomDialog.show(
            context,
            _buildErrorDialog(widget.error, null),
            showClose: true,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(.025),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.image_not_supported_rounded,
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorDialog(Object error, StackTrace? stackTrace) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Image Error',
            style: context.textTheme.titleLarge,
          ),
          const CustomDivider(),
          Flexible(
            child: CustomScrollContent(
              child: RichText(
                text: TextSpan(
                  text: '$error',
                  style: context.textTheme.bodyMedium,
                  children: [
                    if (stackTrace != null)
                      TextSpan(
                        text: '\n\n$stackTrace',
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
