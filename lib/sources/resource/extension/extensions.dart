import 'package:intl/intl.dart';

// Extensao para converter facilmente o valor bruto para valor formatado.
extension ConvertFromInt on int {

  String get toMoedaString {
    double total = this / 100;

    final formato = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
      customPattern: '\u00a4 ##,###.##',
    );
    String result = formato.format(total);
    return result;
  }
}

extension ConvertFromDouble on double {

  String get toMoedaString {
    double total = this / 100;

    final formato = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
      customPattern: '\u00a4 ##,###.##',
    );
    String result = formato.format(total);
    return result;
  }
}

extension ConvertFromString on String {

  String get convertToMoeda {
    double convert = double.parse(this);
    double total = convert / 100;

    final formato = NumberFormat.currency(
      locale: "pt_BR",
      decimalDigits: 2,
      symbol: "R\$",
      customPattern: '##,###.##',
    );
    String result = formato.format(total);
    return result;
  }

}