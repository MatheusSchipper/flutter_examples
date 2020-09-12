import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/currency_converter/currency_converter_module.dart';
import 'package:examples/features/currency_converter/domain/entities/currency.dart';
import 'package:examples/features/currency_converter/domain/entities/currency_value.dart';
import 'package:examples/features/currency_converter/domain/repositories_interfaces/currency_converter_repository_interface.dart';
import 'package:examples/features/currency_converter/domain/usecases/currency_converter_usecase.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

class MockCurrencyConverterRepository extends Mock
    implements ICurrencyConverterRepository {}

void main() {
  MockCurrencyConverterRepository repository;
  ICurrencyConverterUsecase usecase;
  initModule(
    CurrencyConverterModule(),
    changeBinds: [
      modular.Bind<ICurrencyConverterRepository>(
          (i) => MockCurrencyConverterRepository())
    ],
  );
  repository = modular.Modular.get<ICurrencyConverterRepository>();
  usecase = modular.Modular.get<ICurrencyConverterUsecase>();

  test(
    'should return ServerFailure when respository fails',
    () async {
      // Arrange
      when(repository.getCurrencies())
          .thenAnswer((_) async => Left(ServerFailure()));
      // Act
      final result = await usecase.getCurrencies();
      //Assert
      expect(result, equals(Left(ServerFailure())));
    },
  );

  test(
    'should return Currency when respository gets data successfully',
    () async {
      Currency testCurrency = Currency(
        dolar: CurrencyValue(name: 'dolar teste', buy: 5),
        euro: CurrencyValue(name: 'euro teste', buy: 6),
      );
      // Arrange
      when(repository.getCurrencies())
          .thenAnswer((_) async => Right(testCurrency));
      // Act
      final result = await usecase.getCurrencies();
      //Assert
      expect(result, equals(Right(testCurrency)));
    },
  );
}
