import 'package:examples/core/utils/constants.dart';
import 'package:examples/core/utils/input_converter.dart';
import 'package:examples/features/bmi_calculator/bmi_calculator_module.dart';
import 'package:examples/features/bmi_calculator/data/repositories/bmi_calculator_repository.dart';
import 'package:examples/features/bmi_calculator/domain/repositories_interfaces/bmi_calculator_repository_interface.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:examples/features/bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import 'package:examples/features/home/presentation/pages/home_page.dart';
import 'package:examples/features/people_counter/people_counter_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IBmiCalculatorRepository>((i) => BmiCalculatorRepository()),
        Bind((i) => InputConverter()),
        Bind((i) => GetBmiUsecase(repository: i())),
        Bind((i) => BmiCalculatorCubit(usecase: i(), converter: i())),
      ];

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
