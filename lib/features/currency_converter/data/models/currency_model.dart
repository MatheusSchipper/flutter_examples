import 'package:examples/features/currency_converter/data/models/currency_value_model.dart';
import 'package:meta/meta.dart';
import 'package:examples/features/currency_converter/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel({
    @required CurrencyValueModel dolarModel,
    @required CurrencyValueModel euroModel,
  }) : super(dolar: dolarModel, euro: euroModel);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    var defaultDolar = CurrencyValueModel(name: 'dolar_padrao', buy: 5);
    var defaultEuro = CurrencyValueModel(name: 'euro_padrao', buy: 6);
    return CurrencyModel(
      dolarModel: json['currencies'] == null
          ? defaultDolar
          : CurrencyValueModel.fromJson(json['currencies']['USD']),
      euroModel: json['currencies'] == null
          ? defaultEuro
          : CurrencyValueModel.fromJson(json['currencies']['EUR']),
    );
  }
}
