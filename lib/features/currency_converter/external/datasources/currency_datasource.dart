import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../data/datasources_interfaces/currency_datasource.dart';
import '../../data/models/currency_model.dart';

class CurrencyDatasource extends ICurrencyDatasource {
  Dio dio = Modular.get<Dio>();
  @override
  Future<CurrencyModel> getCurrencies() async {
    var response = await dio.get('https://api.hgbrasil.com/finance?');
    if (response.statusCode == 200) {
      return CurrencyModel.fromJson(response.data['results']);
    } else {
      throw ServerException(
          '${response.statusCode} - ${response.statusMessage}');
    }
  }
}
