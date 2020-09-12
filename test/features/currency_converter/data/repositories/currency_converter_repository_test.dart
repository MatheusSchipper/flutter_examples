import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/exceptions.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/currency_converter/currency_converter_module.dart';
import 'package:examples/features/currency_converter/data/datasources_interfaces/currency_datasource.dart';
import 'package:examples/features/currency_converter/data/models/currency_model.dart';
import 'package:examples/features/currency_converter/data/models/currency_value_model.dart';
import 'package:examples/features/currency_converter/domain/repositories_interfaces/currency_converter_repository_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

class MockCurrencyConverterDatasource extends Mock
    implements ICurrencyDatasource {}

void main() {
  ICurrencyDatasource datasource;
  ICurrencyConverterRepository repository;

  setUp(() {
    initModule(CurrencyConverterModule(), changeBinds: [
      modular.Bind<ICurrencyDatasource>(
          (i) => MockCurrencyConverterDatasource()),
    ]);
    datasource = modular.Modular.get<ICurrencyDatasource>();
    repository = modular.Modular.get<ICurrencyConverterRepository>();
  });

  test(
    'should return ServerFailure when a Server Exception occurs with datasource',
    () async {
      // Arrange
      when(datasource.getCurrencies())
          .thenThrow(ServerException('server exception'));

      // Act
      final result = await repository.getCurrencies();
      //Assert
      expect(result, equals(Left(ServerFailure())));
    },
  );

  test(
    'should return CurrencyModel when gets data successfully',
    () async {
      CurrencyModel testCurrencyModel = CurrencyModel(
        dolarModel: CurrencyValueModel(name: 'test dolar', buy: 1),
        euroModel: CurrencyValueModel(name: 'test euro', buy: 1),
      );
      // Arrange
      when(datasource.getCurrencies())
          .thenAnswer((_) async => testCurrencyModel);

      // Act
      final result = await repository.getCurrencies();
      //Assert
      expect(result, equals(Right(testCurrencyModel)));
    },
  );
}
