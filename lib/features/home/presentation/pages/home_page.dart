import 'package:examples/core/utils/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/constants.dart';
import '../../../bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final List<Widget> examples = [
    ItemWidget(
      icon: FontAwesome5Solid.users,
      text: 'Contador de pessoas',
      onPressed: () => Modular.to.pushNamed(peopleCounterRoute),
    ),
    BlocProvider(
      create: (_) => BmiCalculatorCubit(),
      child: ItemWidget(
        icon: FontAwesome5Solid.weight,
        text: 'Calculadora de IMC',
        onPressed: () => Modular.to.pushNamed(bmiCalculatorRoute),
      ),
    ),
    ItemWidget(
      icon: FontAwesome5Solid.dollar_sign,
      text: 'Conversor de moedas',
      onPressed: () => Modular.to.pushNamed(currencyConverterRoute),
    ),
    ItemWidget(
      icon: FontAwesome5Solid.tasks,
      text: 'Lista de tarefas',
      onPressed: () => Modular.to.pushNamed(todoListRoute),
    ),
    ItemWidget(
      icon: FontAwesome5Solid.images,
      text: 'Buscador de Gifs',
      onPressed: () => Modular.to.pushNamed(gifFinderRoute),
    ),
    ItemWidget(
      icon: FontAwesome5Solid.address_card,
      text: 'Lista de contatos',
      onPressed: () => Modular.to.pushNamed(contactRoute),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Tooltip(
          message: 'Barra de Título',
          child: Text(
            'Exemplos',
            style: Theme.of(context).appBarTheme.textTheme.headline4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: [
          ExcludeSemantics(
            child: IconButton(
              icon: Icon(
                FontAwesome5Solid.adjust,
              ),
              onPressed: () {
                ThemeService.instance.changeTheme();
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Tooltip(
          message: 'Lista com ${examples.length} exemplos',
          child: ListView.builder(
            itemCount: examples.length,
            itemBuilder: (context, index) {
              return Tooltip(
                message:
                    'Opção ${index + 1} de ${examples.length} dos exemplos',
                child: examples[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
