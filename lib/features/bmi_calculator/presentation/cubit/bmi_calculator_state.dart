part of 'bmi_calculator_cubit.dart';

abstract class BmiCalculatorState extends Equatable {
  const BmiCalculatorState();

  @override
  List<Object> get props => [];
}

class BmiCalculatorInitial extends BmiCalculatorState {}

class BmiCalculatorCalculating extends BmiCalculatorState {}

class BmiCalculatorDone extends BmiCalculatorState {
  final String bmiResult;

  BmiCalculatorDone({@required this.bmiResult});
}

class BmiCalculatorError extends BmiCalculatorState {
  final String errorMessage;

  BmiCalculatorError({@required this.errorMessage});
}
