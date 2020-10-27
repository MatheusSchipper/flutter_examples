import 'package:examples/core/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../cubit/bmi_calculator_cubit.dart';
import '../widgets/info_text_widget.dart';
import '../widgets/text_field_widget.dart';

class BmiCalculatorView extends StatefulWidget {
  @override
  _BmiCalculatorViewState createState() => _BmiCalculatorViewState();
}

class _BmiCalculatorViewState extends State<BmiCalculatorView> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String initialHeightField = 'Altura (cm)';
  String initialWeightField = 'Peso (kg)';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget bmiCalculatorWidget(BuildContext context, BmiCalculatorState state) {
    if (state is BmiCalculatorCalculating) {
      return CircularProgressIndicator();
    } else if (state is BmiCalculatorError) {
      return InfoTextWidget(
        infoText: state.errorMessage,
        textColor: Colors.red,
      );
    } else if (state is BmiCalculatorDone) {
      return InfoTextWidget(
        infoText: 'Resultado: ${state.bmiResult}',
        textColor: Theme.of(context).accentColor,
      );
    } else {
      return InfoTextWidget(
        infoText: "Informe seus dados",
        textColor: Theme.of(context).accentColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: [
          IconButton(
            icon: Icon(FontAwesome5Solid.redo),
            onPressed: () {
              _resetFields(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesome5Solid.weight,
                    size: screenSize.height * 0.2,
                    color: Theme.of(context).accentColor,
                  ),
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  TextFieldWidget(
                    labelText: initialWeightField,
                    controller: weightController,
                    validator: (String value) {
                      if (value.isEmpty) return "Insira seu peso!";
                    },
                  ),
                  TextFieldWidget(
                    labelText: initialHeightField,
                    controller: heightController,
                    validator: (String value) {
                      if (value.isEmpty) return "Insira sua altura!";
                    },
                  ),
                  ButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          context.bloc<BmiCalculatorCubit>().calculateBmi(
                                weightController.text,
                                heightController.text,
                              );
                        }
                      },
                      text: 'Calcular',
                      tooltip: 'Botão para realizar o cálculo'),
                  bmiCalculatorWidget(context, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _resetFields(BuildContext context) {
    weightController.clear();
    heightController.clear();
    context.bloc<BmiCalculatorCubit>().reset();
  }
}
