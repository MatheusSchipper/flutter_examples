import 'package:examples/features/bmi_calculator/presentation/pages/bmi_calculator_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BmiCalculatorModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => BmiCalculatorPage(),
        )
      ];
}
