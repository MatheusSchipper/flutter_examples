import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onPressed;
  final String subtitle;

  const ItemWidget({
    Key key,
    @required this.icon,
    @required this.onPressed,
    @required this.text,
    this.subtitle = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.maxFinite,
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              side: BorderSide(color: Colors.grey)),
          leading: icon,
          //subtitle: Text(subtitle),
          title: Text(text),
          onTap: onPressed,
        ),
        // child: FlatButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(25)),
        //   ),
        //   color: Colors.grey[100],
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(text),
        //   ),
        //   onPressed: onPressed,
        // ),
      ),
    );
  }
}
