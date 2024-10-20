import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';

/// Componente de seleção de datas
class CustomSelectDate {
  /// Componente para selecionar uma única data
  static Future<DateTime> selectCalendarDate({
    required BuildContext context,
    DateTime? currentDate,
    bool? activeBefore = true,
  }) async {
    return showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      currentDate: currentDate ?? DateTime.now(),
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      selectableDayPredicate: (day) {
        if (activeBefore!) return true;
        if (DateFormat.dateIsToday(day)) return true;
        return DateTime.now().isBefore(day);
      },
      builder: (context, child) {
        final theme = Theme.of(context);
        final color = theme.colorScheme;
        return Theme(
          data: theme.copyWith(
            iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: color.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) => value ?? DateTime.now()).onError(
          (e, s) => DateTime.now(),
        );
  }

  /// Componente para selecionar um intervalo de data
  static Future<DateTimeRange?> selectRangeCalendarDate({
    required BuildContext context,
    DateTime? currentDate,
    bool? activeBefore = true,
  }) async {
    return showDateRangePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      currentDate: currentDate ?? DateTime.now(),
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      firstDate: DateTime(2015),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        final theme = Theme.of(context);
        final color = theme.colorScheme;
        return Theme(
          data: theme.copyWith(
            iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: color.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) => value).onError((e, s) => null);
  }

  /// Componente para selecionar data e hora
  static Future<void> selectDateTime(
    BuildContext context, {
    required VoidCallback onCancel,
    required Function(DateTime selected) onConfirm,
  }) async {
    await selectCalendarDate(context: context).then(
      (value) async {
        if (context.mounted) {
          await CustomTimePicker.select(
            context,
            onCancel: onCancel,
            showClose: false,
            onSelect: (time) {
              int hours = time.inHours;
              int minutes = time.inMinutes % 60;
              final dateTime = value.copyWith(hour: hours, minute: minutes);
              onConfirm(dateTime);
            },
          );
        }
      },
    );
  }
}
