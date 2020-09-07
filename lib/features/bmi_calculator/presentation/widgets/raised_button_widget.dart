import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class RaisedButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const RaisedButtonWidget({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: screenSize.height * 0.1,
        child: RaisedButton(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          onPressed: onPressed,
          splashColor: Colors.green[900],
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          color: Colors.green,
        ),
      ),
    );
  }
}
