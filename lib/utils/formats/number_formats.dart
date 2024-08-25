import 'package:design_system_qclass/extensions/string_extension.dart';
import 'package:intl/intl.dart' as nf show NumberFormat;

class NumberFormat {
  static String toCurrency(
    dynamic value, {
    String? symbol = 'R\$',
    int? decimalDigits,
  }) {
    final format = nf.NumberFormat.currency(
      locale: 'pt_BR',
      symbol: symbol,
      decimalDigits: decimalDigits,
    ).format;
    try {
      return format(value.toString().tryParseCurrencyToDouble).trim();
    } catch (e) {
      return format(0.0);
    }
  }
}
