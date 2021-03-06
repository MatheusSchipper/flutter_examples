import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/core/utils/constants.dart';
import 'package:examples/core/utils/input_converter.dart';
import 'package:examples/features/bmi_calculator/bmi_calculator_module.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:examples/features/bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetBmiUsecase extends Mock implements IGetBmiUsecase {}

class MockInputConverter extends Mock implements IInputConverter {}

void main() {
  BmiCalculatorCubit cubit;
  IGetBmiUsecase mockUsecase;
  IInputConverter mockInputConverter;
  double testWeight = 100;
  String testWeightString = "100";
  String testHeightString = "100";
  String testResult = 'Obesidade Grau III - IMC(${100.toStringAsFixed(2)})';

  setUp(() {
    initModule(BmiCalculatorModule(), changeBinds: [
      modular.Bind<IInputConverter>((i) => MockInputConverter()),
      modular.Bind<IGetBmiUsecase>((i) => MockGetBmiUsecase()),
    ]);
    mockUsecase = modular.Modular.get<IGetBmiUsecase>();
    mockInputConverter = modular.Modular.get<IInputConverter>();
    cubit = modular.Modular.get<BmiCalculatorCubit>();
  });

  test('initialState is BmiCalculatorInitial', () {
    expect(cubit.state, BmiCalculatorInitial());
  });

  test(
    'should emit [BmiCalculatorCalculating, BmiCalculatorError] when convert weight returns an IFailure',
    () async {
      // Arrange
      when(mockInputConverter.stringToDouble(any))
          .thenAnswer((_) => Left(InvalidInputFailure()));
      //Assert later
      final expected = [
        BmiCalculatorCalculating(),
        BmiCalculatorError(errorMessage: invalidInputWeightMessage)
      ];
      expectLater(cubit, emitsInOrder(expected));
      // Act
      cubit.calculateBmi(testWeightString, testHeightString);
    },
  );

  test(
    'should emit a [BmiCalculatorCalculating, BmiCalculatorError] when convert height returns an IFailure',
    () async {
      // Arrange
      final responses = <Either<IFailure, double>>[
        Right(testWeight),
        Left(InvalidInputFailure()),
      ];
      when(mockInputConverter.stringToDouble(any))
          .thenAnswer((_) => responses.removeAt(0));
      //Assert later
      final expected = [
        BmiCalculatorCalculating(),
        BmiCalculatorError(errorMessage: invalidInputHeightMessage)
      ];
      expectLater(cubit, emitsInOrder(expected));
      // Act
      cubit.calculateBmi(testWeightString, testHeightString);
    },
  );

  test(
    '''should emit a [BmiCalculatorCalculating, BmiCalculatorError] when convert weight and height returns valid doubles,
    but useCase returns an IFailure''',
    () async {
      // Arrange
      when(mockInputConverter.stringToDouble(any))
          .thenAnswer((_) => Right(testWeight));
      when(mockUsecase.getBmi(any, any)).thenAnswer((realInvocation) =>
          Left(InvalidInputFailure(message: divideByZeroMessage)));
      //Assert later
      final expected = [
        BmiCalculatorCalculating(),
        BmiCalculatorError(errorMessage: divideByZeroMessage),
      ];
      expectLater(cubit, emitsInOrder(expected));
      // Act
      cubit.calculateBmi(testWeightString, testHeightString);
    },
  );

  test(
    '''should emit a [BmiCalculatorCalculating, BmiCalculatorError] when convert weight and height returns valid doubles, but useCase returns a String with the response''',
    () async {
      // Arrange
      when(mockInputConverter.stringToDouble(any))
          .thenAnswer((_) => Right(testWeight));
      when(mockUsecase.getBmi(any, any))
          .thenAnswer((realInvocation) => Right(testResult));
      //Assert later
      final expected = [
        BmiCalculatorCalculating(),
        BmiCalculatorDone(bmiResult: testResult)
      ];
      expectLater(cubit, emitsInOrder(expected));
      // Act
      cubit.calculateBmi(testWeightString, testHeightString);
    },
  );
}
