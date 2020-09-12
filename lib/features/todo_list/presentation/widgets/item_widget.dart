import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ItemWidget extends StatefulWidget {
  final BuildContext context;
  final dynamic item;
  final Function(bool) onChanged;
  final Function(DismissDirection) onDismissed;

  const ItemWidget({
    Key key,
    @required this.context,
    @required this.item,
    @required this.onChanged,
    @required this.onDismissed,
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: widget.onDismissed,
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(widget.item["title"]),
        value: widget.item["ok"],
        secondary: CircleAvatar(
          child: Icon(
            widget.item["ok"] ? Icons.check : Icons.error,
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
