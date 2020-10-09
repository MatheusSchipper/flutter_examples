import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/constants.dart';
import '../bmi_calculator/bmi_calculator_module.dart';
import '../chat/chat_module.dart';
import '../contact_list/contact_module.dart';
import '../currency_converter/currency_converter_module.dart';
import '../gif_finder/gif_finder_module.dart';
import '../people_counter/people_counter_module.dart';
import '../todo_list/todo_list_module.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => HomePage(),
        ),
        ModularRouter(
          peopleCounterRoute,
          module: PeopleCounterModule(),
        ),
        ModularRouter(
          bmiCalculatorRoute,
          module: BmiCalculatorModule(),
        ),
        ModularRouter(
          currencyConverterRoute,
          module: CurrencyConverterModule(),
        ),
        ModularRouter(
          todoListRoute,
          module: TodoListModule(),
        ),
        ModularRouter(
          gifFinderRoute,
          module: GifFinderModule(),
        ),
        ModularRouter(
          contactRoute,
          module: ContactModule(),
        ),
        ModularRouter(
          chatRoute,
          module: ChatModule(),
        ),
      ];
}
