import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';

abstract class IBmiCalculatorRepository {
  Either<IFailure, double> calculateBmi(double weight, double height);
}
