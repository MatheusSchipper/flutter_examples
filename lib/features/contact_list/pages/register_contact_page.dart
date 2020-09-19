import 'dart:io';

import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/contact_list/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class RegisterContactPage extends StatefulWidget {
  final Contact contact;
  RegisterContactPage({this.contact});
  @override
  _RegisterContactPageState createState() => _RegisterContactPageState();
}

class _RegisterContactPageState extends State<RegisterContactPage> {
  Contact _editedContact;
  bool _edited = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  Future<bool> _requestPop() {
    if (_edited) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Descartar alterações?"),
            content: Text("Se sair, as alterações serão perdidas."),
            actions: [
              FlatButton(
                  textColor: Colors.red,
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  textColor: Colors.red,
                  onPressed: () {
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                  child: Text("Sim")),
            ],
          );
        },
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_editedContact.name ?? "Novo contato"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _editedContact.img != null
                      ? FileImage(File(_editedContact.img))
                      : AssetImage(personImage),
                ),
                onTap: () {
                  ImagePicker().getImage(source: ImageSource.camera).then(
                    (file) {
                      if (file == null) {
                        return;
                      } else {
                        setState(
                          () {
                            _editedContact.img = file.path;
                          },
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                focusNode: _nameFocus,
                decoration: InputDecoration(
                  labelText: "Nome",
                  enabledBorder: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder
                      .copyWith(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                  focusedBorder: Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder
                      .copyWith(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                ),
                cursorColor: Colors.red,
                onChanged: (text) {
                  _edited = true;
                  setState(
                    () {
                      _editedContact.name = text;
                    },
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder
                      .copyWith(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                  focusedBorder: Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder
                      .copyWith(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                ),
                cursorColor: Colors.red,
                onChanged: (text) {
                  _edited = true;
                  _editedContact.email = text;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone",
                  enabledBorder: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder
                      .copyWith(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                  focusedBorder: Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder
                      .copyWith(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                ),
                cursorColor: Colors.red,
                onChanged: (text) {
                  _edited = true;
                  _editedContact.phone = text;
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedContact.name != null && _editedContact.name.isNotEmpty) {
              Modular.to.pop(_editedContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
