/// String extensions for digital account
extension StringExt on String {
  String get capitalize {
    if (length <= 1) return toUpperCase();
    return split(' ').map((e) {
      if (e.length <= 1) return e.toUpperCase();
      return e.substring(0, 1).toUpperCase() + e.substring(1).toLowerCase();
    }).join(' ');
  }

  double? get tryParseToDouble {
    return double.tryParse(toString().replaceFirst(',', '.'));
  }

  double? get tryParseCurrencyToDouble {
    if (split('.').length == 2 && !contains(',')) {
      return double.tryParse(this);
    }
    return double.tryParse(replaceAll('.', '').replaceAll(',', '.'));
  }

  int? get tryParseToInt => int.tryParse(this);
}
