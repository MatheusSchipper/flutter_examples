import 'package:examples/core/utils/constants.dart';
import 'package:examples/core/utils/input_converter.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:examples/features/bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import 'package:examples/features/home/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final converter = Modular.get<InputConverter>();
    final usecase = Modular.get<GetBmiUsecase>();

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
              create: (_) =>
                  BmiCalculatorCubit(converter: converter, usecase: usecase),
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
