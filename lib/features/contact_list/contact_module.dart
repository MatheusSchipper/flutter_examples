import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/contact_list/pages/contact_page.dart';
import 'package:examples/features/contact_list/pages/register_contact_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => ContactPage(),
        ),
        ModularRouter(
          contactDetailModuleRoute,
          child: (context, args) => RegisterContactPage(contact: args.data),
        ),
      ];
}
