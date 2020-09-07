import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  final String infoText;
  final Color textColor;

  const InfoTextWidget({
    Key key,
    @required this.infoText,
    @required this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        infoText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.normal,
          fontSize: 24,
        ),
      ),
    );
  }
}
