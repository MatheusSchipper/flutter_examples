import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ButtonWidget({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.maxFinite,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          color: Colors.grey[100],
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
