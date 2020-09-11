import 'package:examples/core/utils/input_converter.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../cubit/bmi_calculator_cubit.dart';
import 'bmi_calculator_view.dart';

class BmiCalculatorPage extends StatefulWidget {
  @override
  _BmiCalculatorPageState createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  final converter = Modular.get<InputConverter>();
  final usecase = Modular.get<GetBmiUsecase>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiCalculatorCubit(),
      child: BmiCalculatorView(),
    );
  }
}
