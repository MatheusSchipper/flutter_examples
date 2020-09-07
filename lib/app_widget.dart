import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.green[100],
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          button: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
        ),
      ),
    );
  }
}
