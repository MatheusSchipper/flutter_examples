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
        title: Text('Exemplos'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemWidget(
                icon: FontAwesome5Solid.users,
                iconColor: Colors.orange,
                text: '1 - Contador de pessoas',
                onPressed: () => Modular.to.pushNamed(peopleCounterRoute),
              ),
              BlocProvider(
                create: (_) => BmiCalculatorCubit(),
                child: ItemWidget(
                  icon: FontAwesome5Solid.weight,
                  text: '2 - Calculadora de IMC',
                  iconColor: Colors.green,
                  onPressed: () => Modular.to.pushNamed(bmiCalculatorRoute),
                ),
              ),
              ItemWidget(
                icon: FontAwesome5Solid.dollar_sign,
                text: '3 - Conversor de moedas',
                iconColor: Colors.green[900],
                onPressed: () => Modular.to.pushNamed(currencyConverterRoute),
              ),
              ItemWidget(
                icon: FontAwesome5Solid.tasks,
                text: '4 - Lista de tarefas',
                iconColor: Colors.blueAccent,
                onPressed: () => Modular.to.pushNamed(todoListRoute),
              ),
              ItemWidget(
                icon: FontAwesome5Solid.images,
                text: '5 - Buscador de Gifs',
                iconColor: Colors.white,
                onPressed: () => Modular.to.pushNamed(gifFinderRoute),
              ),
              ItemWidget(
                icon: FontAwesome5Solid.address_card,
                text: '6 - Lista de contatos',
                iconColor: Colors.red,
                onPressed: () => Modular.to.pushNamed(contactRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
