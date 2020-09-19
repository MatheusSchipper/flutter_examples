import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const BottomSheetWidget({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
