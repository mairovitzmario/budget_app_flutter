import 'package:intl/intl.dart';

String formatPrice({double price = 0, String? symbol}) {
  String formattedPrice = NumberFormat.compact().format(price);

  if (symbol != null) {
    formattedPrice = symbol + formattedPrice;
  }

  return formattedPrice;
}
