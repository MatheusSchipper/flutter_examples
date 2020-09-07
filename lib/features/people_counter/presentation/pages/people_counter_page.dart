import 'package:examples/core/utils/constants.dart';
import 'package:flutter/material.dart';

class PeopleCounterPage extends StatefulWidget {
  @override
  _PeopleCounterPageState createState() => _PeopleCounterPageState();
}

class _PeopleCounterPageState extends State<PeopleCounterPage> {
  var _count = 0;
  var _infoText = "Local aberto";
  var _rotate = 0;
  var _maxCapacity = 10;

  bool canEnter;

  void _changeCount(int delta) {
    setState(
      () {
        var current = _count + delta;
        _infoText = current < 0
            ? "Mundo invertido?"
            : current >= _maxCapacity ? "Local lotado" : "Pode entrar";
        if (current <= _maxCapacity) {
          if (current < 0) {
            _infoText = "Mundo invertido";
            _rotate = 2;
          } else {
            _rotate = 0;
          }
          _count += delta;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    canEnter = _count != _maxCapacity;
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de pessoas'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RotatedBox(
          quarterTurns: _rotate,
          child: Stack(
            children: [
              Image.asset(
                restauranteImage,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''Aplicação simples para demonstrar controles básicos utilizando SetState
e utilização de Widgets como Card, Row, FlatButton e Image. Para interagir com esse exemplo, utilize
os botões de incremento(+1) e decremento(-1).''',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange[200],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Card(
                  elevation: 25,
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pessoas: $_count',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.orange[100],
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              child: Text('-1'),
                              textColor: Colors.orange,
                              onPressed: () {
                                _changeCount(-1);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              child: Text(
                                '+1',
                              ),
                              textColor: Colors.orange,
                              onPressed: canEnter
                                  ? () {
                                      _changeCount(1);
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$_infoText',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith(
                                bodyText1: TextStyle(
                              color: Colors.orange[100],
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                            ))
                            .bodyText1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                          value: _count.toDouble() / 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
