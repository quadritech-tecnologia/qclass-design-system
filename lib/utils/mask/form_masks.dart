import 'package:brasil_fields/brasil_fields.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormMasks {
  static TextInputFormatter cpf() {
    return CpfInputFormatter();
  }

  static TextInputFormatter cnpj() {
    return CnpjInputFormatter();
  }

  static TextInputFormatter phone() {
    return TelefoneInputFormatter();
  }

  static TextInputFormatter date() {
    return DataInputFormatter();
  }

  static TextInputFormatter dateTime() {
    return MaskTextInputFormatter(
      mask: '##/##/#### ##:##:##',
      filter: {'#': RegExp(r'\d')},
    );
  }

  static TextInputFormatter creditCard() {
    return MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {'#': RegExp(r'\d')},
    );
  }

  static TextInputFormatter zipCode() {
    return CepInputFormatter();
  }

  static TextInputFormatter currency({
    String locale = 'pt_BR',
    String? name,
    String? symbol,
    int decimalDigits = 2,
    String? customPattern,
    bool turnOffGrouping = false,
    bool enableNegative = true,
  }) {
    return CurrencyTextInputFormatter(
      NumberFormat.currency(
        locale: locale,
        name: name,
        symbol: symbol,
        decimalDigits: decimalDigits,
        customPattern: customPattern,
      ),
      enableNegative: enableNegative,
    );
  }

  static TextInputFormatter plate() {
    return MaskTextInputFormatter(
      mask: '###-####',
      filter: {'#': RegExp(r'[0-9A-Za-z]')},
    );
  }
}
