import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../helpers/contact_helper.dart';

class ItemCardWidget extends StatelessWidget {
  final Contact contact;
  final Function onTap;

  const ItemCardWidget({
    Key key,
    @required this.contact,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 10,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: contact.img != null
                    ? FileImage(
                        File(contact.img),
                      )
                    : AssetImage(personImage),
                backgroundColor: Colors.red[50],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name ?? "",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    contact.email ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    contact.phone ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
