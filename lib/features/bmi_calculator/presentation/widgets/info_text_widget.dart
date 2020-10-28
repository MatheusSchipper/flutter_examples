import 'package:flutter/material.dart';

class InfoTextWidget extends StatelessWidget {
  final String infoText;
  final Color textColor;
  final FocusNode focusNode;

  const InfoTextWidget({
    Key key,
    @required this.infoText,
    @required this.textColor,
    @required this.focusNode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Focus(
        focusNode: focusNode,
        child: Text(
          infoText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.normal,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
