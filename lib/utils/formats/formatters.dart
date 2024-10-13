import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static String formatPhoneMask(String? phone) {
    var formatedPhone = '';
    if (phone == '' || phone == null) return '';
    if (phone.contains('+55')) phone = phone.substring(3);
    if (phone.length > 10) {
      formatedPhone =
          '''(${phone.substring(0, 2)}) ${phone.substring(2, 7)}-${phone.substring(7)}''';
    } else {
      formatedPhone =
          '''(${phone.substring(0, 2)}) ${phone.substring(2, 6)}-${phone.substring(6)}''';
    }

    return formatedPhone;
  }

  static String formatWppNumber(String? phone) {
    if (phone == null || phone.isEmpty) return '';

    var formatedPhone = phone.replaceAll(' ', '');

    if (Platform.isAndroid && !formatedPhone.contains('+55')) {
      return '+55$formatedPhone';
    } else {
      return formatedPhone;
    }
  }

  static DateTime getDateTimeZone(String date) {
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').parseUTC(date).toLocal();
  }

  static String formatDateTimeZone(String date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(getDateTimeZone(date));
  }

  static String formatDateTimeZoneCoupon(String date) {
    return DateFormat('dd/MM/yyyy - HH:mm:ss').format(getDateTimeZone(date));
  }

  static String phoneUnmask(String phone) {
    return MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    ).unmaskText(phone);
  }

  static String accessKeyFormatter(String accessKey) {
    return MaskTextInputFormatter(
      mask:
          ''''####   ####   ####   ####   ####   ####   ####   ####   ####   ####   ####''',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    ).maskText(accessKey);
  }

  static String cpfFormatter(String cpf) {
    return MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    ).maskText(cpf);
  }

  static String cpfUnmask(String cpf) {
    return MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    ).unmaskText(cpf);
  }

  static String formatToAmontCents({required double value}) {
    return value.toStringAsPrecision(3).replaceAll('.', '').replaceAll(',', '');
  }

  // ignore: non_constant_identifier_names
  static MaskTextInputFormatter get QRCodeFormatter => MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {
          '#': RegExp(r'[0-9]'),
        },
      );

  static String? formatDate(String pattern, String date) {
    if (date.length < 8) throw 'A data deve ter 8 dígitos';
    switch (pattern) {
      case 'YYYYMMDD':
        var newDate = date.substring(4, 8);
        newDate += '-';
        newDate += date.substring(2, 4);
        newDate += '-';
        newDate += date.substring(0, 2);
        return newDate;
      case 'DD/MM/AAAA':
        var newDate = date.substring(8, 10);
        newDate += '/';
        newDate += date.substring(5, 7);
        newDate += '/';
        newDate += date.substring(0, 4);
        return newDate;
    }
    return null;
  }

  static String formatDateToString(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String hourToString(DateTime date) {
    return '''${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}''';
  }

  static String formatDateToStringBd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatDateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  static DateTime getDate(String date) {
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(date);
  }

  static DateTime getDateYyyyMMdd(String date) {
    return DateFormat('yyyy-MM-dd').parse(date);
  }

  static String openBankDateFormat(String? date) {
    if (date == null) {
      return '';
    }
    List<String> months = [
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez',
      '',
    ];
    var dt = date.split('-');
    return '${dt.last}-${months[(int.tryParse(dt[1]) ?? 13) - 1]}';
  }

  static String paymentDateFormat(String? date) {
    if (date == null) {
      return '';
    }
    List<String> months = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
      '',
    ];
    var dt = date.split('-');
    return '''${dt[2].split('T')[0]} de ${months[(int.tryParse(dt[1]) ?? 13) - 1]} de ${dt[0]} às ${dt.last.split('T')[1].split(':')[0]}:${dt.last.split('T')[1].split(':')[1]}h''';
  }

  static String getDateChangeEmail(DateTime date) {
    var dateChangeEmail = formatDateTimeToString(date);
    var aux1 = dateChangeEmail.substring(0, 10);
    var aux2 = dateChangeEmail.substring(11, 16);
    var res = '$aux1 às $aux2';
    return res;
  }

  static String formatExpirationDate(String? expirationDate) {
    if (expirationDate == '' || expirationDate == null) return '';
    var date =
        '${expirationDate.substring(8, 10)}/${expirationDate.substring(5, 7)}/${expirationDate.substring(0, 4)}';
    return date;
  }

  static String barCodeFormatter(String planCode) {
    var newCode = '';
    for (var indice = 0; indice < planCode.length; indice++) {
      if (indice % 8 == 0) {
        newCode += '${planCode.substring(indice - 8, indice)} ';
      }
    }

    return newCode;
  }

  static String removeDiacritics(String str) {
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (var i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }

    return str;
  }

  static String formatcurrencyPtBr(double amount) {
    var f = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return f.format(amount);
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class BarcodeInputFormatter extends MaskTextInputFormatter {
  static String maskA =
      '#####.##### #####.###### #####.###### # ###############';
  static String maskB = '############ ############ ############ ############ #';

  BarcodeInputFormatter({String? initialText})
      : super(mask: maskB, filter: {'#': RegExp(r'[0-9]')});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var textToChange = super.unmaskText(newValue.text);

    if (textToChange.length <= 48) {
      if (getMask() != maskB) {
        super.updateMask(mask: maskB);
      }
    } else {
      if (getMask() != maskA) {
        super.updateMask(mask: maskA);
      }
    }

    return TextEditingValue(
      text: super.maskText(textToChange),
      selection: TextSelection.collapsed(
        offset: super.maskText(textToChange).trim().length,
      ),
    );
  }
}

class DateTimeFormatter extends TextInputFormatter {
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var currentText = newValue.text.replaceAll('/', '').split('');
    if (currentText.length > 2) {
      currentText.insertAll(2, ['/']);
    }
    if (currentText.length > 5) {
      currentText.insertAll(5, ['/']);
    }
    if (currentText.length > 10) {
      currentText = currentText.sublist(0, 10);
    }
    var newText = currentText.join('');
    return TextEditingValue(
      text: newText,
      selection:
          TextSelection.fromPosition(TextPosition(offset: newText.length)),
    );
  }
}
