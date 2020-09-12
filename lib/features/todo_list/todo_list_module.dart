import 'package:examples/features/todo_list/presentation/pages/todo_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoListModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => TodoListPage(),
        )
      ];
}
