import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bmi_calculator_cubit.dart';
import 'bmi_calculator_view.dart';

class BmiCalculatorPage extends StatefulWidget {
  @override
  _BmiCalculatorPageState createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiCalculatorCubit(),
      child: BmiCalculatorView(),
    );
  }
}
