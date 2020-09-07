import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  /// String Fuction (value) {}
  final Function validator;

  const TextFieldWidget({
    Key key,
    @required this.text,
    @required this.controller,
    @required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            labelText: text,
            labelStyle: TextStyle(
              color: Colors.green,
            ),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.green,
          ),
          cursorColor: Colors.green,
          validator: validator,
        ),
      ),
    );
  }
}
