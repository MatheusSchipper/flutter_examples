import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examples/core/exceptions/exceptions.dart';
import 'package:examples/features/currency_converter/data/datasources_interfaces/currency_datasource.dart';
import 'package:examples/features/currency_converter/data/models/currency_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
