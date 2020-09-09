import 'package:dio/dio.dart';
import 'package:examples/features/currency_converter/presentation/widgets/currency_text_field_widget.dart';
import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController realController = TextEditingController();
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();

  Future<Map> getData() async {
    Response response = await Dio().get('https://api.hgbrasil.com/finance?');
    return response.data;
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
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              );
              break;
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Erro ao carregar informações"),
                );
              } else if (!snapshot.hasData) {
                return Center(child: Text('Nenhuma informação encontrada'));
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
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
              }
          }
        },
      ),
    );
  }
}
