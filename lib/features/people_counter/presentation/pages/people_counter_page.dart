import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/people_counter/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PeopleCounterPage extends StatefulWidget {
  @override
  _PeopleCounterPageState createState() => _PeopleCounterPageState();
}

class _PeopleCounterPageState extends State<PeopleCounterPage> {
  var _count = 0;
  var _infoText = "Local aberto";
  var _rotate = 0;
  var _maxCapacity = 10;
  var _minCapacity = -1;

  bool canEnter;

  void _changeCount(int delta) {
    setState(
      () {
        var current = _count + delta;
        _infoText = current < 0
            ? "Mundo invertido"
            : current >= _maxCapacity
                ? "Local lotado"
                : "Pode entrar";
        if (current >= _minCapacity && current <= _maxCapacity) {
          if (current < 0) {
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
    canEnter = _count < _maxCapacity && _count >= _minCapacity;
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
                restaurantImage,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''Aplicação simples para demonstrar controles básicos utilizando SetState
e utilização de Widgets como Card, Row, FlatButton e Image. Para interagir com esse exemplo, utilize
os botões de incremento(+) e decremento(-).''',
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
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      SleekCircularSlider(
                        min: -1,
                        max: 10,
                        initialValue: _count.toDouble(),
                        innerWidget: (value) => Center(
                          child: Text(
                            '${value.toInt()}',
                            style: TextStyle(color: Colors.orange[100]),
                          ),
                        ),
                        appearance: CircularSliderAppearance(
                          customColors: CustomSliderColors(
                            progressBarColors: [
                              Colors.red,
                              Colors.orange,
                              Colors.white,
                            ],
                            dotColor: Colors.orange,
                            progressBarColor: Colors.orange,
                            trackColor: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Pessoas',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.orange[100],
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                              onPressed: () {
                                _changeCount(-1);
                              },
                              text: '-'),
                          ButtonWidget(
                            onPressed: canEnter
                                ? () {
                                    _changeCount(1);
                                  }
                                : null,
                            text: '+',
                          ),
                        ],
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
