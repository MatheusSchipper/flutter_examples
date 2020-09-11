import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/bmi_calculator/bmi_calculator_module.dart';
import 'package:examples/features/bmi_calculator/data/repositories/bmi_calculator_repository.dart';
import 'package:examples/features/bmi_calculator/domain/repositories_interfaces/bmi_calculator_repository_interface.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  IBmiCalculatorRepository repository;

  setUp(() {
    initModule(BmiCalculatorModule());
    repository = Modular.get<IBmiCalculatorRepository>();
  });
  test(
    'should return an InvalidInputFailure when height is less than zero',
    () async {
      // Arrange
      double testWeight = 0;
      double testHeight = 0;
      // Act
      final result = repository.calculateBmi(testWeight, testHeight);
      //Assert
      expect(result, equals(Left(InvalidInputFailure())));
    },
  );

  test(
    'should return a value when height and weight are valid',
    () async {
      // Arrange
      double testWeight = 100;
      double testHeight = 100;
      double testResult = 100;

      // Act
      final result = repository.calculateBmi(testWeight, testHeight);
      //Assert
      expect(result, equals(Right(testResult)));
    },
  );
}
