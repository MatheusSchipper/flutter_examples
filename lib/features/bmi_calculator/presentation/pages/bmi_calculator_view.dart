import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bmi_calculator_cubit.dart';
import '../widgets/info_text_widget.dart';
import '../widgets/raised_button_widget.dart';
import '../widgets/text_field_widget.dart';

class BmiCalculatorView extends StatefulWidget {
  @override
  _BmiCalculatorViewState createState() => _BmiCalculatorViewState();
}

class _BmiCalculatorViewState extends State<BmiCalculatorView> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFilters(BuildContext context) {
    weightController.clear();
    heightController.clear();
    context.bloc<BmiCalculatorCubit>().reset();
    _formKey.currentState.reset();
  }

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
        infoText: state.bmiResult,
        textColor: Colors.green,
      );
    } else {
      return InfoTextWidget(
        infoText: "Informe seus dados",
        textColor: Colors.green,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFilters(context);
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
                    Icons.person_outline,
                    size: screenSize.height * 0.2,
                    color: Colors.green,
                  ),
                  TextFieldWidget(
                    text: 'Peso (kg)',
                    controller: weightController,
                    validator: (String value) {
                      if (value.isEmpty) return "Insira seu peso!";
                    },
                  ),
                  TextFieldWidget(
                    text: 'Altura (cm)',
                    controller: heightController,
                    validator: (String value) {
                      if (value.isEmpty) return "Insira sua altura!";
                    },
                  ),
                  RaisedButtonWidget(
                      text: 'Calcular',
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          context.bloc<BmiCalculatorCubit>().calculateBmi(
                                weightController.text,
                                heightController.text,
                              );
                      }),
                  bmiCalculatorWidget(context, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
