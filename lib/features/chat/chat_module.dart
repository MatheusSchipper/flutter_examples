import 'package:examples/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => ChatPage(),
        ),
      ];
}
