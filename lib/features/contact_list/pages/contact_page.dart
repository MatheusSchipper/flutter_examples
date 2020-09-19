import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/contact_list/helpers/contact_helper.dart';
import 'package:examples/features/contact_list/pages/register_contact_page.dart';
import 'package:examples/features/contact_list/pages/widgets/bottom_sheet_item_widget.dart';
import 'package:examples/features/contact_list/pages/widgets/item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

enum OrderOptions { orderAZ, orderZA }

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    getAllContacts();
  }

  void getAllContacts() {
    helper.getAllContacts().then(
      (value) {
        setState(
          () {
            contacts = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) {
              return <PopupMenuEntry<OrderOptions>>[
                const PopupMenuItem<OrderOptions>(
                  child: Text("Ordenar de A-Z"),
                  value: OrderOptions.orderAZ,
                ),
                const PopupMenuItem<OrderOptions>(
                  child: Text("Ordenar de Z-A"),
                  value: OrderOptions.orderZA,
                ),
              ];
            },
            onSelected: _orderList,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return ItemCardWidget(
            contact: contact,
            onTap: () {
              _showOptions(contact, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showRegisterPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showRegisterPage({Contact contact}) async {
    final recContact = await Modular.to.push(
      MaterialPageRoute(
        builder: (context) => RegisterContactPage(contact: contact),
      ),
    );
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
      } else {
        await helper.saveContact(recContact);
      }
      getAllContacts();
    }
  }

  void _showOptions(Contact contact, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BottomSheetWidget(
                    text: "Ligar",
                    onPressed: () async {
                      var url = "tel:${contact.phone}";
                      if (contact.phone != null && contact.phone.isNotEmpty) {
                        await launch(url);
                        Modular.to.pop();
                      } else {
                        Modular.to.pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Ops"),
                              content: Text(
                                  "Para realizar ligações, o telefone do contato deve estar preenchido."),
                              actions: [
                                FlatButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    Modular.to.pop();
                                  },
                                  child: Text("Ok"),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  BottomSheetWidget(
                    text: "Editar",
                    onPressed: () {
                      Modular.to.pop();
                      _showRegisterPage(contact: contact);
                    },
                  ),
                  BottomSheetWidget(
                    text: "Excluir",
                    onPressed: () async {
                      await helper.deleteContact(contact.id);
                      setState(() {
                        contacts.removeAt(index);
                        Modular.to.pop();
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _orderList(OrderOptions orderOptions) {
    switch (orderOptions) {
      case OrderOptions.orderAZ:
        setState(() {
          contacts.sort((a, b) {
            return a.name.toLowerCase().compareTo(b.name.toLowerCase());
          });
        });
        break;
      case OrderOptions.orderZA:
        setState(() {
          contacts.sort((a, b) {
            return b.name.toLowerCase().compareTo(a.name.toLowerCase());
          });
        });
        break;
    }
  }
}
