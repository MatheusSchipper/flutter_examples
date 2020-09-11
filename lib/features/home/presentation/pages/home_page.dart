import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/constants.dart';
import '../../../bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import '../widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplos'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonWidget(
              text: '1 - Contador de pessoas',
              onPressed: () => Modular.to.pushNamed(peopleCounterRoute),
            ),
            BlocProvider(
              create: (_) => BmiCalculatorCubit(),
              child: ButtonWidget(
                text: '2 - Calculadora de IMC',
                onPressed: () => Modular.to.pushNamed(bmiCalculatorRoute),
              ),
            ),
            ButtonWidget(
              text: '3 - Conversor de moedas',
              onPressed: () => Modular.to.pushNamed(currencyConverterRoute),
            ),
          ],
        ),
      ),
    );
  }
}
