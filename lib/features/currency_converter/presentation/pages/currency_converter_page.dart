import 'package:examples/features/currency_converter/domain/entities/currency.dart';
import 'package:examples/features/currency_converter/domain/usecases/currency_converter_usecase.dart';
import 'package:examples/features/currency_converter/presentation/cubit/currency_converter_cubit.dart';
import 'package:examples/features/currency_converter/presentation/widgets/currency_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController realController = TextEditingController();
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();
  Future<Currency> getCurrencies;

  @override
  void initState() {
    super.initState();
    context.bloc<CurrencyConverterCubit>().getCurrencies();
  }

  void clearAll() {
    realController.clear();
    dolarController.clear();
    euroController.clear();
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double _dolar = double.parse(text);
    realController.text = (_dolar * dolar).toStringAsFixed(2);
    euroController.text = (_dolar * dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double _euro = double.parse(text);
    realController.text = (_euro * euro).toStringAsFixed(2);
    dolarController.text = (_euro * euro / dolar).toStringAsFixed(2);
  }

  double dolar;
  double euro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('\$ Conversor \$'),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
        builder: (context, state) {
          if (state is CurrencyConverterError) {
            return Center(
              child: Text("Erro ao carregar informações - ${state.message}"),
            );
          } else if (state is CurrencyConverterDone) {
            dolar = state.currency.dolar.buy;
            euro = state.currency.euro.buy;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.monetization_on,
                      color: Colors.green,
                      size: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ),
                  CurrencyTextFieldWidget(
                    labelText: 'Reais',
                    color: Colors.green,
                    prefixText: 'R\$ ',
                    controller: realController,
                    onChanged: _realChanged,
                  ),
                  Divider(),
                  CurrencyTextFieldWidget(
                    labelText: 'Dólares',
                    color: Colors.green,
                    prefixText: 'U\$ ',
                    controller: dolarController,
                    onChanged: _dolarChanged,
                  ),
                  Divider(),
                  CurrencyTextFieldWidget(
                    labelText: 'Euros',
                    color: Colors.green,
                    prefixText: '€ ',
                    controller: euroController,
                    onChanged: _euroChanged,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            );
          }
        },
      ),
      // body: FutureBuilder<Map>(
      //   future: getData(),
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.none:
      //       case ConnectionState.waiting:
      //         return Center(
      //           child: CircularProgressIndicator(
      //             valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      //           ),
      //         );
      //         break;
      //       default:
      //         if (snapshot.hasError) {
      //           return Center(
      //             child: Text("Erro ao carregar informações"),
      //           );
      //         } else if (!snapshot.hasData) {
      //           return Center(child: Text('Nenhuma informação encontrada'));
      //         } else {
      //           var teste = snapshot.data;
      //           euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
      //           return SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.stretch,
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Icon(
      //                     Icons.monetization_on,
      //                     color: Colors.green,
      //                     size: MediaQuery.of(context).size.height * 0.15,
      //                   ),
      //                 ),
      //                 CurrencyTextFieldWidget(
      //                   labelText: 'Reais',
      //                   color: Colors.green,
      //                   prefixText: 'R\$ ',
      //                   controller: realController,
      //                   onChanged: _realChanged,
      //                 ),
      //                 Divider(),
      //                 CurrencyTextFieldWidget(
      //                   labelText: 'Dólares',
      //                   color: Colors.green,
      //                   prefixText: 'U\$ ',
      //                   controller: dolarController,
      //                   onChanged: _dolarChanged,
      //                 ),
      //                 Divider(),
      //                 CurrencyTextFieldWidget(
      //                   labelText: 'Euros',
      //                   color: Colors.green,
      //                   prefixText: '€ ',
      //                   controller: euroController,
      //                   onChanged: _euroChanged,
      //                 ),
      //               ],
      //             ),
      //           );
      //         }
      //     }
      //   },
      // ),
    );
  }
}
