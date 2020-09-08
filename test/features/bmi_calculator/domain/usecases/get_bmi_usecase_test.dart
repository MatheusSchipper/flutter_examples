import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/bmi_calculator/domain/repositories_interfaces/bmi_calculator_repository_interface.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements IBmiCalculatorRepository {}

void main() {
  GetBmiUsecase usecase;
  MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetBmiUsecase(repository: mockRepository);
  });

  test(
    'should return an InvalidInputFailure when inputs are invalid',
    () async {
      double testWeight = 100;
      double testHeight = 100;
      // Arrange
      when(mockRepository.calculateBmi(any, any))
          .thenAnswer((_) => Left(InvalidInputFailure()));
      // Act
      final result = usecase.getBmi(testWeight, testHeight);
      //Assert
      verify(mockRepository.calculateBmi(testWeight, testHeight));
      expect(result, equals(Left(InvalidInputFailure())));
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test(
    'should return a value when inputs are valid',
    () async {
      double testWeight = 100;
      double testHeight = 100;
      double testBmi = 100;
      String testResult =
          'Obesidade Grau III - IMC(${testBmi.toStringAsFixed(2)})';
      // Arrange
      when(mockRepository.calculateBmi(any, any))
          .thenAnswer((_) => Right(testBmi));
      // Act
      final result = usecase.getBmi(testWeight, testHeight);
      //Assert
      verify(mockRepository.calculateBmi(testWeight, testHeight));
      expect(result, equals(Right(testResult)));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
