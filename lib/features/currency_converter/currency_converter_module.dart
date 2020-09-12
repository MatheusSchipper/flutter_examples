import 'package:examples/features/currency_converter/data/datasources_interfaces/currency_datasource.dart';
import 'package:examples/features/currency_converter/data/repositories/currency_converter_repository.dart';
import 'package:examples/features/currency_converter/domain/repositories_interfaces/currency_converter_repository_interface.dart';
import 'package:examples/features/currency_converter/external/datasources/currency_datasource.dart';
import 'package:examples/features/currency_converter/presentation/cubit/currency_converter_cubit.dart';
import 'package:examples/features/currency_converter/presentation/pages/currency_converter_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/currency_converter_usecase.dart';

class CurrencyConverterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICurrencyDatasource>((i) => CurrencyDatasource()),
        Bind<ICurrencyConverterRepository>(
            (i) => CurrencyConverterRepository()),
        Bind<ICurrencyConverterUsecase>((i) => CurrencyConverterUsecase()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => BlocProvider(
            create: (_) => CurrencyConverterCubit(),
            child: CurrencyConverterPage(),
          ),
        ),
      ];
}
