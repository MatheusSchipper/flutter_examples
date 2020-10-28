import 'package:examples/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  static ThemeService instance = ThemeService();

  bool isDarkTheme = false;

  ThemeData currentTheme;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    currentTheme = isDarkTheme ? _darkTheme : _lightTheme;

    notifyListeners();
  }

  void changeThemeListener() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    isDarkTheme = brightness == Brightness.dark;
    currentTheme = isDarkTheme ? _darkTheme : _lightTheme;

    notifyListeners();
  }

  ThemeData get _lightTheme => ThemeData(
        primaryColor: Colors.orange[800],
        buttonColor: Colors.orange[100],
        disabledColor: Colors.black,
        accentColor: Colors.black,
        indicatorColor: Colors.green,
        cardTheme: CardTheme(
          color: Colors.orange.withOpacity(0.7),
        ),
        cursorColor: Colors.black,
        textSelectionHandleColor: Colors.black,
        scaffoldBackgroundColor: Colors.orange[200],
        appBarTheme: AppBarTheme(
          color: Colors.orange[800],
          centerTitle: true,
          elevation: 10,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: fontSemiBold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: fontLight,
            fontSize: 96,
          ),
          headline2: TextStyle(
            fontFamily: fontLight,
            fontSize: 60,
          ),
          headline3: TextStyle(
            fontFamily: fontRegular,
            fontSize: 48,
          ),
          headline4: TextStyle(
            fontFamily: fontRegular,
            fontSize: 34,
          ),
          headline5: TextStyle(
            fontFamily: fontRegular,
            fontSize: 24,
          ),
          headline6: TextStyle(
            fontFamily: fontSemiBold,
            fontSize: 20,
          ),
          subtitle1: TextStyle(
            fontFamily: fontRegular,
            fontSize: 16,
          ),
          subtitle2: TextStyle(
            fontFamily: fontSemiBold,
            fontSize: 14,
          ),
          bodyText1: TextStyle(
            fontFamily: fontRegular,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            fontFamily: fontRegular,
            fontSize: 14,
          ),
          button: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: fontSemiBold,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontFamily: fontRegular,
          ),
          overline: TextStyle(
            fontSize: 10,
            fontFamily: fontRegular,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange[100],
          disabledColor: Colors.grey,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        fontFamily: fontRegular,
      );

  ThemeData get _darkTheme => ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.orange,
        brightness: Brightness.dark,
        cardTheme: CardTheme(
          color: Colors.grey[850].withOpacity(0.7),
        ),
        buttonColor: Colors.black,
        disabledColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          centerTitle: true,
          elevation: 10,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontFamily: fontSemiBold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.orange,
          ),
        ),
        cursorColor: Colors.orange,
        textSelectionHandleColor: Colors.orange,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[100]),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[100]),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(color: Colors.orange[100]),
          hintStyle: TextStyle(color: Colors.orange[100]),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: fontLight,
            fontSize: 96,
          ),
          headline2: TextStyle(
            fontFamily: fontLight,
            fontSize: 60,
          ),
          headline3: TextStyle(
            fontFamily: fontRegular,
            fontSize: 48,
          ),
          headline4: TextStyle(
            fontFamily: fontRegular,
            fontSize: 34,
          ),
          headline5: TextStyle(
            fontFamily: fontRegular,
            fontSize: 24,
          ),
          headline6: TextStyle(
            fontFamily: fontSemiBold,
            fontSize: 20,
          ),
          subtitle1: TextStyle(
            fontFamily: fontRegular,
            fontSize: 16,
          ),
          subtitle2: TextStyle(
            fontFamily: fontSemiBold,
            fontSize: 14,
          ),
          bodyText1: TextStyle(
            fontFamily: fontRegular,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            fontFamily: fontRegular,
            fontSize: 14,
          ),
          button: TextStyle(
            fontSize: 14,
            fontFamily: fontSemiBold,
            color: Colors.orange[100],
          ),
          caption: TextStyle(
            fontSize: 12,
            fontFamily: fontRegular,
          ),
          overline: TextStyle(
            fontSize: 10,
            fontFamily: fontRegular,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          disabledColor: Colors.grey,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[850],
        fontFamily: fontRegular,
      );
}
