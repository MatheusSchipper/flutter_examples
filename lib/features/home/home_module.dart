import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/bmi_calculator/bmi_calculator_module.dart';
import 'package:examples/features/home/presentation/pages/home_page.dart';
import 'package:examples/features/people_counter/people_counter_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      ];
}
