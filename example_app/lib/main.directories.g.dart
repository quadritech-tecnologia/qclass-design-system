// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example_app/presentation/widgets/bottom_sheet/custom_bottom_sheet.dart'
    as _i2;
import 'package:example_app/presentation/widgets/buttons/custom_button_examples.dart'
    as _i3;
import 'package:example_app/presentation/widgets/dialog/custom_dialog.dart'
    as _i4;
import 'package:example_app/presentation/widgets/inputs/custom_input_field.dart'
    as _i5;
import 'package:example_app/presentation/widgets/pickers/custom_date_picker.dart'
    as _i6;
import 'package:example_app/presentation/widgets/snackbar/custom_snack_bar.dart'
    as _i7;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'bottom_sheet',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomBottomSheet',
            useCase: _i1.WidgetbookUseCase(
              name: 'ShowDatePicker',
              builder: _i2.showBottomSheet,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'buttons',
        children: [
          _i1.WidgetbookComponent(
            name: 'CustomButton',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'background button',
                builder: _i3.backgroundButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'no shape button',
                builder: _i3.noShapeButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'primary',
                builder: _i3.primaryButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'secundary',
                builder: _i3.secundaryButton,
              ),
              _i1.WidgetbookUseCase(
                name: 'tertiary',
                builder: _i3.tertiaryButton,
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
              builder: _i4.showDialogMessage,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'inputs',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomInputField',
            useCase: _i1.WidgetbookUseCase(
              name: 'InputField',
              builder: _i5.showInputText,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'pickers',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CustomSelectDate',
            useCase: _i1.WidgetbookUseCase(
              name: 'ShowDatePicker',
              builder: _i6.showDatePicker,
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
              builder: _i7.showSuccessSnackBar,
            ),
          )
        ],
      ),
    ],
  )
];
