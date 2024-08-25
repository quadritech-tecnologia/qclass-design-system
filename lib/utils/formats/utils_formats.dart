import 'dart:io' show Platform;

import 'package:brasil_fields/brasil_fields.dart';

class UtilsFormats {
  static String cpf(String cpf) {
    try {
      if (cpf.isNotEmpty && UtilBrasilFields.isCPFValido(cpf)) {
        return UtilBrasilFields.obterCpf(cpf);
      }
      return cpf;
    } catch (e) {
      return cpf;
    }
  }

  static String cnpj(String cnpj) {
    try {
      if (cnpj.isNotEmpty && UtilBrasilFields.isCNPJValido(cnpj)) {
        return UtilBrasilFields.obterCnpj(cnpj);
      }
      return cnpj;
    } catch (e) {
      return cnpj;
    }
  }

  static String phone(String phone) {
    try {
      if (phone.isNotEmpty) {
        String number = phone;
        String countryCode = '';
        if (number.contains('+')) {
          countryCode = '${number.substring(0, 3)} ';
          number = number.substring(3);
        }
        return '$countryCode${UtilBrasilFields.obterTelefone(number)}';
      }
      return phone;
    } catch (e) {
      return phone;
    }
  }

  static String whatsapp(String? phone) {
    if (phone == null || phone.isEmpty) return '';

    var date = phone.replaceAll(' ', '');

    if (Platform.isAndroid && !date.contains('+55')) {
      return '+55$date';
    } else {
      return date;
    }
  }
}
