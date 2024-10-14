import 'package:design_system_qclass/design_system_qclass.dart'
    show
        ButtonHeightType,
        ButtonType,
        CustomBottomSheet,
        CustomButton,
        CustomScrollContent,
        Responsive,
        Spacing,
        SpacingExt;
import 'package:flutter/cupertino.dart';

/// Mostra o seletor de hora e minuto e retorna um `Duration`
class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    this.duration,
    this.onSelect,
    this.onCancel,
    this.isLoading = false,
    this.isEnabled = true,
  });

  final Duration? duration;
  final Function(Duration)? onSelect;
  final Function()? onCancel;
  final bool isLoading;
  final bool isEnabled;

  static Future<DateTime?> select(
    BuildContext context, {
    Duration? duration,
    Function(Duration)? onSelect,
    Function()? onCancel,
    showClose = true,
  }) async {
    return CustomBottomSheet.showBottomSheet(
      context: context,
      child: CustomTimePicker(
        duration: duration,
        onSelect: onSelect,
        onCancel: onCancel,
      ),
    );
  }

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  Duration _selectedDuration = const Duration(hours: 0, minutes: 0);

  @override
  void initState() {
    super.initState();
    _selectedDuration = widget.duration ??
        Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AbsorbPointer(
        absorbing: !widget.isEnabled,
        child: Opacity(
          opacity: !widget.isEnabled || widget.isLoading ? .5 : 1,
          child: CustomScrollContent(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 256.responsiveHeight),
                    child: _timer,
                  ),
                ),
                Spacing.md.vertical,
                _buttons,
                Spacing.md.vertical,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _timer {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      initialTimerDuration: _selectedDuration,
      onTimerDurationChanged: (Duration newDuration) {
        _selectedDuration = newDuration;
      },
    );
  }

  Widget get _buttons {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.sm.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: CustomButton.text(
              text: 'Cancelar',
              onPressed: widget.onCancel,
              type: ButtonType.noShape,
              heightType: ButtonHeightType.small,
            ),
          ),
          Spacing.sm.horizontal,
          Flexible(
            child: CustomButton.text(
              text: 'Confirmar',
              isEnabled: true,
              heightType: ButtonHeightType.small,
              onPressed: () {
                if (widget.onSelect != null) {
                  widget.onSelect!(_selectedDuration);
                }
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
