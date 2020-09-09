import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/currency_converter/presentation/pages/currency_converter_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CurrencyConverterModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => CurrencyConverterPage(),
        ),
      ];
}
