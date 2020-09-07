import 'package:examples/features/people_counter/presentation/pages/people_counter_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PeopleCounterModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => PeopleCounterPage(),
        )
      ];
}
