// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example_app/presentation/widgets/buttons/custom_button_examples.dart'
    as _i2;
import 'package:example_app/presentation/widgets/dialog/custom_dialog.dart'
    as _i3;
import 'package:example_app/presentation/widgets/snackbar/custom_snack_bar.dart'
    as _i4;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'buttons',
        children: [
          _i1.WidgetbookComponent(
            name: 'CustomButton',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'background button',
                builder: _i2.backgroundButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'no shape button',
                builder: _i2.noShapeButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'primary',
                builder: _i2.primaryButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'secundary',
                builder: _i2.secundaryButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'tertiary',
                builder: _i2.tertiaryButton,
              ),
            ],
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'dialogs',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomDialog',
            useCase: _i1.WidgetbookUseCase(
              name: 'dialog',
              builder: _i3.showDialogMessage,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'snackbar',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomSnackBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'snackbar',
              builder: _i4.showSuccessSnackBar,
            ),
          )
        ],
      ),
    ],
  )
];
