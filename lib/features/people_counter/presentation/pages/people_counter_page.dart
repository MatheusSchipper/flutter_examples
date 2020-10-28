import 'package:examples/core/utils/constants.dart';
import 'package:examples/core/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PeopleCounterPage extends StatefulWidget {
  @override
  _PeopleCounterPageState createState() => _PeopleCounterPageState();
}

class _PeopleCounterPageState extends State<PeopleCounterPage> {
  var _count = 0;
  var _infoText = "Pode entrar";
  var _maxCapacity = 10;
  var _minCapacity = 0;

  bool canEnter;

  FocusNode incrementFocusNode = FocusNode();
  FocusNode decrementFocusNode = FocusNode();

  void _changeCount(int delta) {
    setState(
      () {
        var current = _count + delta;
        _infoText = current >= _maxCapacity ? "Local lotado" : "Pode entrar";
        if (current >= _minCapacity && current <= _maxCapacity) {
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
        leading: MergeSemantics(
          child: IconButton(
            tooltip: 'Botão Voltar',
            icon: Icon(
              FontAwesome5Solid.chevron_left,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Tooltip(
          message: 'Barra de título',
          child: Text('Contador de pessoas'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            ExcludeSemantics(
              child: Image.asset(
                restaurantImage,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            Column(
              children: [
                Tooltip(
                  message: 'Texto introdutório',
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '''Aplicação simples para demonstrar controles básicos utilizando SetState
e utilização de Widgets como Card, Row, FlatButton e Image. Para interagir com esse exemplo, utilize
os botões de incremento(+1) e decremento(-1).''',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.orange[100]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    color: Theme.of(context).cardTheme.color,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Tooltip(
                          message: 'Informação sobre a lotação do local.',
                          child: Text('$_infoText',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      color: Theme.of(context).accentColor)),
                        ),
                        Tooltip(
                          message: 'Número de pessoas no local',
                          child: SleekCircularSlider(
                            min: 0,
                            max: 10,
                            initialValue: _count.toDouble(),
                            innerWidget: (value) => Center(
                              child: Text('${value.toInt()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                        color: Theme.of(context).accentColor,
                                      )),
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
                                shadowColor: Colors.black,
                                trackColor: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        ExcludeSemantics(
                          child: Text(
                            'Número de pessoas',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Theme.of(context).accentColor,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Semantics(
                              button: true,
                              enabled: _count > _minCapacity,
                              child: ButtonWidget(
                                  focusNode: decrementFocusNode,
                                  tooltip: 'Botão decremento',
                                  onPressed: _count > _minCapacity
                                      ? () {
                                          _changeCount(-1);
                                        }
                                      : null,
                                  text: '-1'),
                            ),
                            Semantics(
                              button: true,
                              enabled: canEnter,
                              child: ButtonWidget(
                                focusNode: incrementFocusNode,
                                tooltip: 'Botão incremento',
                                onPressed: canEnter
                                    ? () {
                                        _changeCount(1);
                                      }
                                    : null,
                                text: '+1',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
