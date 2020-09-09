import 'package:flutter/material.dart';

class CurrencyTextFieldWidget extends StatelessWidget {
  final String labelText;
  final Color color;
  final String prefixText;
  final TextEditingController controller;
  final Function onChanged;

  const CurrencyTextFieldWidget({
    Key key,
    @required this.labelText,
    @required this.color,
    @required this.prefixText,
    @required this.controller,
    @required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: color,
            fontSize: 24,
          ),
          prefixText: prefixText,
          prefixStyle: TextStyle(
            color: color,
            fontSize: 24,
          ),
        ),
        cursorColor: color,
        style: TextStyle(color: color, fontSize: 24),
      ),
    );
  }
}
