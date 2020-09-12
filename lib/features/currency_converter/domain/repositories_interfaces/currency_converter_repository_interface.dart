import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/currency_converter/domain/entities/currency.dart';

abstract class ICurrencyConverterRepository {
  Future<Either<IFailure, Currency>> getCurrencies();
}
