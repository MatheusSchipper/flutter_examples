import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/home/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplos'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ButtonWidget(
              child: Text('1 - Contador de pessoas'),
              onPressed: () => Modular.to.pushNamed(peopleCounterRoute),
            ),
          ],
        ),
      ),
    );
  }
}
