import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final String tooltip;

  const ButtonWidget({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.grey,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: -2,
              blurRadius: 10,
              offset: Offset(7, 7),
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        child: RaisedButton(
          color: Colors.transparent,
          disabledColor: Colors.transparent,
          elevation: 0,
          child: Tooltip(
            message: tooltip,
            child: Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ),
          textColor: Colors.orange,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
