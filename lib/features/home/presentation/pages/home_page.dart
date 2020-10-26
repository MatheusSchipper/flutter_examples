import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/constants.dart';
import '../../../bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Tooltip(
          message: 'Barra de Título',
          child: Text('Exemplos'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Tooltip(
            message: 'Lista com 6 exemplos',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Tooltip(
                  message: 'Opção 1 de 6 dos exemplos',
                  child: ItemWidget(
                    icon: FontAwesome5Solid.users,
                    iconColor: Colors.orange,
                    text: 'Contador de pessoas',
                    onPressed: () => Modular.to.pushNamed(peopleCounterRoute),
                  ),
                ),
                Tooltip(
                  message: 'Opção 2 de 6 dos exemplos',
                  child: BlocProvider(
                    create: (_) => BmiCalculatorCubit(),
                    child: ItemWidget(
                      icon: FontAwesome5Solid.weight,
                      text: 'Calculadora de IMC',
                      iconColor: Colors.green,
                      onPressed: () => Modular.to.pushNamed(bmiCalculatorRoute),
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Opção 3 de 6 dos exemplos',
                  child: ItemWidget(
                    icon: FontAwesome5Solid.dollar_sign,
                    text: 'Conversor de moedas',
                    iconColor: Colors.green[900],
                    onPressed: () =>
                        Modular.to.pushNamed(currencyConverterRoute),
                  ),
                ),
                Tooltip(
                  message: 'Opção 4 de 6 dos exemplos',
                  child: ItemWidget(
                    icon: FontAwesome5Solid.tasks,
                    text: 'Lista de tarefas',
                    iconColor: Colors.blueAccent,
                    onPressed: () => Modular.to.pushNamed(todoListRoute),
                  ),
                ),
                Tooltip(
                  message: 'Opção 5 de 6 dos exemplos',
                  child: ItemWidget(
                    icon: FontAwesome5Solid.images,
                    text: 'Buscador de Gifs',
                    iconColor: Colors.white,
                    onPressed: () => Modular.to.pushNamed(gifFinderRoute),
                  ),
                ),
                Tooltip(
                  message: 'Opção 6 de 6 dos exemplos',
                  child: ItemWidget(
                    icon: FontAwesome5Solid.address_card,
                    text: 'Lista de contatos',
                    iconColor: Colors.red,
                    onPressed: () => Modular.to.pushNamed(contactRoute),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
