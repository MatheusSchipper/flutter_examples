import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:examples/core/utils/constants.dart';
import 'package:examples/core/utils/input_converter.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  final IGetBmiUsecase usecase = Modular.get<IGetBmiUsecase>();
  final IInputConverter converter = Modular.get<IInputConverter>();

  BmiCalculatorCubit() : super(BmiCalculatorInitial());

  void calculateBmi(String weight, String height) {
    emit(BmiCalculatorCalculating());
    var weightValueResult = converter.stringToDouble(weight);
    double weightValue;
    weightValueResult.fold(
      (failure) {
        emit(BmiCalculatorError(errorMessage: invalidInputWeightMessage));
        return;
      },
      (successWeight) {
        weightValue = successWeight;
        var heightValueResult = converter.stringToDouble(height);
        double heightValue;
        heightValueResult.fold(
          (failure) {
            emit(BmiCalculatorError(errorMessage: invalidInputHeightMessage));
            return;
          },
          (successHeight) {
            heightValue = successHeight;
            final bmiResult = usecase.getBmi(weightValue, heightValue);
            bmiResult.fold((failure) {
              emit(BmiCalculatorError(errorMessage: failure.message));
              return;
            }, (success) => emit(BmiCalculatorDone(bmiResult: success)));
          },
        );
      },
    );
  }

  void reset() {
    emit(BmiCalculatorInitial());
  }
}
