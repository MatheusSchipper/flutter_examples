import 'package:examples/features/todo_list/todo_list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/constants.dart';
import '../bmi_calculator/bmi_calculator_module.dart';
import '../currency_converter/currency_converter_module.dart';
import '../people_counter/people_counter_module.dart';
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
      ];
}
