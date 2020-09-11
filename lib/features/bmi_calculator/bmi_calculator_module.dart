import 'package:examples/core/utils/input_converter.dart';
import 'package:examples/features/bmi_calculator/data/repositories/bmi_calculator_repository.dart';
import 'package:examples/features/bmi_calculator/domain/repositories_interfaces/bmi_calculator_repository_interface.dart';
import 'package:examples/features/bmi_calculator/domain/usecases/get_bmi_usecase.dart';
import 'package:examples/features/bmi_calculator/presentation/cubit/bmi_calculator_cubit.dart';
import 'package:examples/features/bmi_calculator/presentation/pages/bmi_calculator_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BmiCalculatorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IBmiCalculatorRepository>((i) => BmiCalculatorRepository()),
        Bind<IInputConverter>((i) => InputConverter()),
        Bind<IGetBmiUsecase>((i) => GetBmiUsecase()),
        Bind((i) => BmiCalculatorCubit()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => BmiCalculatorPage(),
        ),
      ];
}
