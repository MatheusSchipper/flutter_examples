import 'package:meta/meta.dart';
import 'package:examples/features/currency_converter/domain/entities/currency_value.dart';

class Currency {
  final CurrencyValue dolar;
  final CurrencyValue euro;

  Currency({
    @required this.dolar,
    @required this.euro,
  });
}
