import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';

abstract class IInputConverter {
  Either<IFailure, double> stringToDouble(String input);
}

class InputConverter implements IInputConverter {
  Either<IFailure, double> stringToDouble(String input) {
    try {
      final value = double.parse(input);
      if (value <= 0) {
        throw FormatException();
      } else
        return Right(value);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
