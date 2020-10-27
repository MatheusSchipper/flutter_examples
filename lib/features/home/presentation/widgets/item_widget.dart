import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  const ItemWidget({
    Key key,
    @required this.icon,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
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
          width: size.width * 0.7,
          child: ListTile(
            leading: Icon(
              icon,
              color: Theme.of(context).textTheme.button.color,
            ),
            title: Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}
