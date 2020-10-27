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
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        elevation: 10,
        child: Tooltip(
          message: tooltip,
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
        ),
        textColor: Theme.of(context).textTheme.button.color,
        onPressed: onPressed,
      ),
    );
  }
}
