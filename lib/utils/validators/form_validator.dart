import 'package:design_system_qclass/design_system_qclass.dart';

class FormValidators {
  static String? emptyField(String? input) {
    if (input == null || input.isEmpty) {
      return 'Este campo não pode ser vazio.';
    }
    return null;
  }

  static String? invalidLength(String? input, int length) {
    if (input == null || input.isEmpty) return null;
    if (input.length < length) {
      return 'Campo deve conter no mínimo $length caractére(s).';
    }
    return null;
  }

  static String? zipCode(String? input) {
    if (input == null || input.isEmpty) return null;
    if (input.replaceAll(RegExp(r'[^0-9]'), '').length < 8) {
      return 'CEP inválido.';
    }
    return null;
  }

  static String? invalidDouble(String? input) {
    if (input == null || input.isEmpty) return null;
    if (double.tryParse(input.replaceAll(',', '.')) == null) {
      return 'Campo deve ser um valor decimal.';
    }
    return null;
  }

  static String? invalidCurrency(String? input) {
    if (input == null || input.isEmpty) return null;
    if (input.tryParseCurrencyToDouble == null) {
      return 'Campo deve ser um valor decimal.';
    }
    return null;
  }

  static String? invalidPhone(String? input) {
    if (emptyField(input) != null) {
      return emptyField(input);
    }

    // Define a regular expression for a simple phone validation
    final phoneRegex = RegExp(r'(\(\d{2}\)\s)(\d{4,5}\-\d{4})');

    if (!phoneRegex.hasMatch(input!)) {
      return 'Número de telefone inválido.';
    }
    return null;
  }

  static String? invalidEmail(String? input) {
    if (emptyField(input) != null) {
      return emptyField(input);
    }

    // Define a regular expression for a simple email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegex.hasMatch(input!)) {
      return 'E-mail inválido.';
    }
    return null;
  }

  static String? invalidFullName(String? input) {
    if (emptyField(input) != null) {
      return emptyField(input);
    }
    if (input!.trim().split(' ').length < 2) {
      return 'Campo deve conter nome completo.';
    }
    if (input.contains(RegExp(r'[0-9]'))) {
      return 'Campo não deve conter números.';
    }
    if (RegExp(r'[$#@!%.*\|/?><,º;:&_ª•¶§∞¢£™πø¥†®œå()+-=]+').hasMatch(input)) {
      return 'Nome não pode conter caracteres especiais';
    }
    return null;
  }

  static String? invalidSameField(String? input, String refer) {
    if (input != refer) {
      return 'Campos devem ser iguais.';
    }
    return null;
  }

  static String? invalidCPF(String? input) {
    if (!CPFValidator.isValid(input)) {
      return 'CPF inválido.';
    }
    return null;
  }

  static String? invalidGreaterThan(String? input, double refer) {
    final value = input?.replaceFirst(',', '.') ?? '';
    if (double.tryParse(value) != null) {
      if (double.parse(value) < refer) {
        return 'Campo deve ser maior ou igual à $refer';
      }
    } else if (double.tryParse(value) == null && value.isNotEmpty) {
      return 'Campo deve ser um número decimal.';
    }
    return null;
  }

  static String? invalidLessThan(String? input, double refer) {
    final value = input?.replaceFirst(',', '.') ?? '';
    if (double.tryParse(value) != null) {
      if (double.parse(value) > refer) {
        return 'Campo deve ser menor ou igual à $refer';
      }
    } else if (double.tryParse(value) == null && value.isNotEmpty) {
      return 'Campo deve ser um número decimal.';
    }
    return null;
  }

  static String? invalidGreaterThanCurrency(String? input, double refer) {
    if (input == null || input.isEmpty) return null;
    if ((input.tryParseCurrencyToDouble ?? 0) < refer) {
      return '''Campo deve ser maior ou igual à ${NumberFormat.toCurrency(refer)}''';
    }
    return null;
  }

  static String? invalidGreaterThanAndLessThanOrEqualToCurrency(
    String? input,
    double min,
    double max,
  ) {
    if (input == null || input.isEmpty) return null;
    if ((input.tryParseCurrencyToDouble ?? 0) < min ||
        (input.tryParseCurrencyToDouble ?? 0) > max) {
      return '''Valor deve ser maior ou igual à ${NumberFormat.toCurrency(min)} e menor ou igual à ${NumberFormat.toCurrency(max)}''';
    }
    return null;
  }

  static String? invalidLessThanCurrency(String? input, double refer) {
    if (input == null || input.isEmpty) return null;
    if ((input.tryParseCurrencyToDouble ?? 0) > refer) {
      return '''Campo deve ser menor ou igual à ${NumberFormat.toCurrency(refer)}''';
    }
    return null;
  }

  static String? plate({String? plate}) {
    if (plate == null || plate.isEmpty) return 'Este campo não pode ser vazio.';

    final regx = RegExp(r'(^[A-Z]{3}-[0-9][0-9A-Z][0-9]{2})');
    if (!regx.hasMatch(plate)) {
      return 'Placa inválida';
    }
    return null;
  }

  static String? invalidDate(String? input) {
    if (input == null || input.isEmpty) {
      return null;
    }
    if (DateFormat.fromString(input, format: 'dd/MM/yyyy') == null ||
        input.length != 10) {
      return 'Data inválida';
    }
    return null;
  }
}
