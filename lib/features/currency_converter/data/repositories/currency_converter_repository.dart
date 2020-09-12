import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/exceptions.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/currency_converter/data/datasources_interfaces/currency_datasource.dart';
import 'package:examples/features/currency_converter/domain/entities/currency.dart';
import 'package:examples/features/currency_converter/domain/repositories_interfaces/currency_converter_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CurrencyConverterRepository implements ICurrencyConverterRepository {
  final ICurrencyDatasource datasource = Modular.get<ICurrencyDatasource>();
  @override
  Future<Either<IFailure, Currency>> getCurrencies() async {
    try {
      final result = await datasource.getCurrencies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
