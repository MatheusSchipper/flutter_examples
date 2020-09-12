import 'package:examples/features/currency_converter/data/models/currency_model.dart';

abstract class ICurrencyDatasource {
  Future<CurrencyModel> getCurrencies();
}
