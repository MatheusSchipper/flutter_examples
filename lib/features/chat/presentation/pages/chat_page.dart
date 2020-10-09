import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("messagea").doc("msg1").set(
      {
        "text": "Olá",
        "from": "Daniel",
        "read": false,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
