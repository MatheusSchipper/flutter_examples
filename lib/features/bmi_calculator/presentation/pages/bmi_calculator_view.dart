import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../../core/presentation/widgets/button_widget.dart';
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

  final weightFocusNode = FocusNode();
  final heightFocusNode = FocusNode();
  final buttonFocusNode = FocusNode();
  final resultFocusNode = FocusNode();

  void _resetFields(BuildContext context) {
    weightController.clear();
    heightController.clear();
    context.bloc<BmiCalculatorCubit>().reset();
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Valores dos campos Peso e Altura apagados'),
        backgroundColor: Colors.green[800],
      ),
    );
  }

  @override
  void dispose() {
    resultFocusNode.dispose();
    weightFocusNode.dispose();
    heightFocusNode.dispose();
    buttonFocusNode.dispose();
    super.dispose();
  }

  Widget bmiCalculatorWidget(BuildContext context, BmiCalculatorState state) {
    Widget widgetToShow = SizedBox();
    if (state is BmiCalculatorCalculating) {
      widgetToShow = CircularProgressIndicator();
    } else if (state is BmiCalculatorError) {
      widgetToShow = InfoTextWidget(
        focusNode: resultFocusNode,
        infoText: state.errorMessage,
        textColor: Colors.red,
      );
    } else if (state is BmiCalculatorDone) {
      widgetToShow = InfoTextWidget(
        focusNode: resultFocusNode,
        infoText: 'Resultado: ${state.bmiResult}',
        textColor: Theme.of(context).accentColor,
      );
    } else {
      widgetToShow = ExcludeSemantics(
        child: InfoTextWidget(
          focusNode: resultFocusNode,
          infoText: "Informe seus dados",
          textColor: Theme.of(context).accentColor,
        ),
      );
    }
    return widgetToShow;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Tooltip(
          message: 'Barra de título',
          child: Text('Calculadora de IMC'),
        ),
        leading: MergeSemantics(
          child: IconButton(
            tooltip: 'Botão Voltar',
            icon: Icon(
              FontAwesome5Solid.chevron_left,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: [
          MergeSemantics(
            child: Tooltip(
              message: 'Botão para apagar os valores dos campos Peso e Altura',
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(FontAwesome5Solid.redo),
                  onPressed: () {
                    _resetFields(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
        builder: (context, state) {
          return Tooltip(
            message:
                'Formulário com os campos Peso e Altura, usados para calcular o IMC de uma pessoa',
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ExcludeSemantics(
                      child: Icon(
                        FontAwesome5Solid.weight,
                        size: screenSize.height * 0.2,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    ExcludeSemantics(
                      child: Divider(
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    TextFieldWidget(
                      fieldName: 'Peso',
                      focusNode: weightFocusNode,
                      onEditingComplete: () {
                        heightFocusNode.requestFocus();
                      },
                      labelText: initialWeightField,
                      controller: weightController,
                      tooltip: 'Informe o peso a ser calculado, em kilograma',
                      validator: (String value) {
                        if (value.isEmpty) return "Campo peso obrigatório";
                      },
                    ),
                    TextFieldWidget(
                      fieldName: 'Altura',
                      focusNode: heightFocusNode,
                      onEditingComplete: () {
                        buttonFocusNode.requestFocus();
                      },
                      tooltip:
                          'Informe a altura a ser calculada, em centímetros',
                      labelText: initialHeightField,
                      controller: heightController,
                      validator: (String value) {
                        if (value.isEmpty) return "Campo altura obrigatório";
                      },
                    ),
                    ButtonWidget(
                        focusNode: buttonFocusNode,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            context.bloc<BmiCalculatorCubit>().calculateBmi(
                                  weightController.text,
                                  heightController.text,
                                );
                            resultFocusNode.requestFocus();
                          }
                        },
                        text: 'Calcular',
                        tooltip: 'Botão para realizar o cálculo'),
                    bmiCalculatorWidget(context, state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
