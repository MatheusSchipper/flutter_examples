import 'package:meta/meta.dart';
import 'package:examples/features/currency_converter/domain/entities/currency_value.dart';

class CurrencyValueModel extends CurrencyValue {
  CurrencyValueModel({
    @required String name,
    @required double buy,
  }) : super(name: name, buy: buy);

  factory CurrencyValueModel.fromJson(Map<String, dynamic> json) {
    return CurrencyValueModel(name: json['name'], buy: json['buy']);
  }
}
