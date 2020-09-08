import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/bmi_calculator/domain/repositories_interfaces/bmi_calculator_repository_interface.dart';

class BmiCalculatorRepository implements IBmiCalculatorRepository {
  @override
  Either<IFailure, double> calculateBmi(double weight, double height) {
    try {
      if (height <= 0) throw FormatException(divideByZeroMessage);
      final bmiValue = weight / pow(height / 100, 2);
      return Right(bmiValue);
    } on FormatException catch (e) {
      return Left(InvalidInputFailure(message: e.toString()));
    }
  }
}
