import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:meta/meta.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Function validator;
  final String tooltip;
  final FocusNode focusNode;
  final Function onEditingComplete;
  final String fieldName;

  const TextFieldWidget({
    Key key,
    @required this.labelText,
    @required this.controller,
    @required this.validator,
    @required this.tooltip,
    @required this.focusNode,
    @required this.onEditingComplete,
    @required this.fieldName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message: tooltip,
          child: TextFormField(
            focusNode: focusNode,
            autovalidateMode: controller.text.isEmpty
                ? AutovalidateMode.disabled
                : AutovalidateMode.always,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              suffixIcon: Tooltip(
                message:
                    'Botão para apagar todo o conteúdo do campo $fieldName',
                child: IconButton(
                  icon: Icon(FontAwesome5Solid.times),
                  onPressed: () {
                    controller.clear();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Conteúdo do campo $fieldName apagado'),
                        backgroundColor: Colors.green[800],
                      ),
                    );
                    focusNode.unfocus();
                  },
                ),
              ),
              labelText: labelText,
            ),
            onEditingComplete: onEditingComplete,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button,
            cursorColor: Theme.of(context).accentColor,
            validator: validator,
          ),
        ),
      ),
    );
  }
}
