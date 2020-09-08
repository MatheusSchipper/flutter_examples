import 'package:dartz/dartz.dart';
import 'package:examples/core/exceptions/failures.dart';
import 'package:examples/features/bmi_calculator/domain/repositories_interfaces/bmi_calculator_repository_interface.dart';
import 'package:meta/meta.dart';

class GetBmiUsecase {
  final IBmiCalculatorRepository repository;

  GetBmiUsecase({@required this.repository});

  Either<IFailure, String> getBmi(double weight, double height) {
    final result = repository.calculateBmi(weight, height);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (bmi) {
        var info = "";
        final bmiFormatted = bmi.toStringAsFixed(2);
        if (bmi < 18.6) {
          info = "Abaixo do peso";
        } else if (bmi >= 18.6 && bmi < 24.9) {
          info = "Peso Ideal";
        } else if (bmi >= 24.9 && bmi < 29.9) {
          info = "Levemente Acima do Peso";
        } else if (bmi >= 29.9 && bmi < 34.9) {
          info = "Obesidade Grau I";
        } else if (bmi >= 34.9 && bmi < 39.9) {
          info = "Obesidade Grau II";
        } else {
          info = "Obesidade Grau III";
        }
        return Right('$info - IMC($bmiFormatted)');
      },
    );
  }
}
