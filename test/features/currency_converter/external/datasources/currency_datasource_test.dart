import 'package:dio/dio.dart';
import 'package:examples/app_module.dart';
import 'package:examples/core/exceptions/exceptions.dart';
import 'package:examples/features/currency_converter/currency_converter_module.dart';
import 'package:examples/features/currency_converter/data/datasources_interfaces/currency_datasource.dart';
import 'package:examples/features/currency_converter/data/models/currency_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  ICurrencyDatasource datasource;
  MockDio mockDio;
  setUp(() {
    initModules([
      AppModule(),
      CurrencyConverterModule()
    ], changeBinds: [
      Bind<Dio>((i) => MockDio()),
    ]);
    mockDio = Modular.get<Dio>();

    datasource = Modular.get<ICurrencyDatasource>();
  });

  test(
    'should return an ServerException when statusCode isnt 200',
    () async {
      // Arrange
      when(mockDio.get(any)).thenAnswer((_) async => Response(statusCode: 400));

      //Assert
      expect(() async {
        // Act
        await datasource.getCurrencies();
      }, throwsA(TypeMatcher<ServerException>()));
    },
  );

  test(
    'should return a CurrencyModel when statusCode is 200',
    () async {
      // Arrange
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: fixture('currency_converter.json'),
        ),
      );
      // Act
      final result = await datasource.getCurrencies();
      //Assert
      expect(result, isA<CurrencyModel>());
    },
  );
}
