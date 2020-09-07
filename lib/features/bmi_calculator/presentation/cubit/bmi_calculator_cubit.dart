import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  BmiCalculatorCubit() : super(BmiCalculatorInitial());

  void calculateBmi(String weight, String height) {
    try {
      emit(BmiCalculatorCalculating());
      final bmi = double.parse(weight) / pow(double.parse(height) / 100, 2);

      var result = "";
      final bmiFormatted = bmi.toStringAsPrecision(3);
      if (bmi < 18.6) {
        result = "Abaixo do peso";
      } else if (bmi >= 18.6 && bmi < 24.9) {
        result = "Peso Ideal";
      } else if (bmi >= 24.9 && bmi < 29.9) {
        result = "Levemente Acima do Peso";
      } else if (bmi >= 29.9 && bmi < 34.9) {
        result = "Obesidade Grau I";
      } else if (bmi >= 34.9 && bmi < 39.9) {
        result = "Obesidade Grau I";
      } else {
        result = "Obesidade Grau III";
      }
      emit(BmiCalculatorDone(bmiResult: '$result - IMC($bmiFormatted)'));
    } on FormatException {
      emit(BmiCalculatorError(errorMessage: 'Dados inválidos'));
    }
  }

  void reset() {
    emit(BmiCalculatorInitial());
  }
}
