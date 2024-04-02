import 'package:intl/intl.dart';

class FormatText {
  static String formatVND(double amount) {
    final formatter = NumberFormat("#,### VND", "vi_VN");
    return formatter.format(amount);
  }

  static String formatUSD(double amount) {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatter.format(amount);
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}
