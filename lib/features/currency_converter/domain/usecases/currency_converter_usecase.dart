import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/currency_converter/domain/entities/currency.dart';
import 'package:examples/features/currency_converter/domain/repositories_interfaces/currency_converter_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ICurrencyConverterUsecase {
  Future<Either<IFailure, Currency>> getCurrencies();
}

class CurrencyConverterUsecase implements ICurrencyConverterUsecase {
  final ICurrencyConverterRepository repository =
      Modular.get<ICurrencyConverterRepository>();
  @override
  Future<Either<IFailure, Currency>> getCurrencies() async {
    return await repository.getCurrencies();
  }
}
