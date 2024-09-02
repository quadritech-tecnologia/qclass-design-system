import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'primary', type: CustomButton)
Widget primaryButton(BuildContext context) {
  bool isLoading = false;
  void onTap() {
    isLoading = !isLoading;
  }

  final widgets = [
    CustomButton(
      onPressed: onTap,
      isLoading: isLoading,
      child: const Text('default button'),
    ),
    CustomButton.text(
      text: 'Text button',
      isLoading: isLoading,
      onPressed: onTap,
    ),
    CustomButton.icon(
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
    ),
    CustomButton.iconText(
      text: 'Text icon button',
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
    ),
  ];

  return Scaffold(
    body: ListView.separated(
      padding: EdgeInsets.all(Spacing.md.value),
      itemCount: widgets.length,
      separatorBuilder: (context, index) {
        return Spacing.md.vertical;
      },
      itemBuilder: (context, index) {
        return widgets[index];
      },
    ),
  );
}

@widgetbook.UseCase(name: 'secundary', type: CustomButton)
Widget secundaryButton(BuildContext context) {
  bool isLoading = false;
  const type = ButtonType.secondary;

  void onTap() {
    isLoading = !isLoading;
  }

  final widgets = [
    CustomButton(
      onPressed: onTap,
      isLoading: isLoading,
      type: type,
      child: const Text('default button'),
    ),
    CustomButton.text(
      text: 'Text button',
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.icon(
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.iconText(
      text: 'Text icon button',
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
  ];

  return Scaffold(
    body: ListView.separated(
      padding: EdgeInsets.all(Spacing.md.value),
      itemCount: widgets.length,
      separatorBuilder: (context, index) {
        return Spacing.md.vertical;
      },
      itemBuilder: (context, index) {
        return widgets[index];
      },
    ),
  );
}

@widgetbook.UseCase(name: 'tertiary', type: CustomButton)
Widget tertiaryButton(BuildContext context) {
  bool isLoading = false;
  const type = ButtonType.tertiary;

  void onTap() {
    isLoading = !isLoading;
  }

  final widgets = [
    CustomButton(
      onPressed: onTap,
      isLoading: isLoading,
      type: type,
      child: const Text('Primary button'),
    ),
    CustomButton.text(
      text: 'Text button',
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.icon(
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.iconText(
      text: 'Text icon button',
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
  ];

  return Scaffold(
    body: ListView.separated(
      padding: EdgeInsets.all(Spacing.md.value),
      itemCount: widgets.length,
      separatorBuilder: (context, index) {
        return Spacing.md.vertical;
      },
      itemBuilder: (context, index) {
        return widgets[index];
      },
    ),
  );
}

@widgetbook.UseCase(name: 'no shape button', type: CustomButton)
Widget noShapeButton(BuildContext context) {
  bool isLoading = false;
  const type = ButtonType.noShape;

  void onTap() {
    isLoading = !isLoading;
  }

  final widgets = [
    CustomButton(
      onPressed: onTap,
      isLoading: isLoading,
      type: type,
      child: const Text('default button'),
    ),
    CustomButton.text(
      text: 'Text button',
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.icon(
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.iconText(
      text: 'Text icon button',
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
  ];

  return Scaffold(
    body: ListView.separated(
      padding: EdgeInsets.all(Spacing.md.value),
      itemCount: widgets.length,
      separatorBuilder: (context, index) {
        return Spacing.md.vertical;
      },
      itemBuilder: (context, index) {
        return widgets[index];
      },
    ),
  );
}

@widgetbook.UseCase(name: 'background button', type: CustomButton)
Widget backgroundButton(BuildContext context) {
  bool isLoading = false;
  const type = ButtonType.background;

  void onTap() {
    isLoading = !isLoading;
  }

  final widgets = [
    CustomButton(
      onPressed: onTap,
      isLoading: isLoading,
      type: type,
      child: const Text('default button'),
    ),
    CustomButton.text(
      text: 'Text button',
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.icon(
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
    CustomButton.iconText(
      text: 'Text icon button',
      icon: Icons.favorite,
      isLoading: isLoading,
      onPressed: onTap,
      type: type,
    ),
  ];

  return Scaffold(
    body: ListView.separated(
      padding: EdgeInsets.all(Spacing.md.value),
      itemCount: widgets.length,
      separatorBuilder: (context, index) {
        return Spacing.md.vertical;
      },
      itemBuilder: (context, index) {
        return widgets[index];
      },
    ),
  );
}
