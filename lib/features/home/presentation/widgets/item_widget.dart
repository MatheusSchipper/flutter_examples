import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  final Color iconColor;

  const ItemWidget({
    Key key,
    @required this.icon,
    @required this.onPressed,
    @required this.text,
    @required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.grey,
                Colors.grey[100],
                Colors.white,
              ],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              // bottomRight: Radius.circular(15),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                side: BorderSide(color: Colors.grey)),
            leading: Icon(
              icon,
              color: iconColor,
            ),
            title: Text(text),
            onTap: onPressed,
          ),
        ),
      ),
    );
  }
}
