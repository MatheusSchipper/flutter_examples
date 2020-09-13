import 'package:examples/core/utils/constants.dart';
import 'package:examples/features/gif_finder/presentation/pages/gif_detail_page.dart';
import 'package:examples/features/gif_finder/presentation/pages/gif_finder_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GifFinderModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => GifFinderPage(),
        ),
        ModularRouter(
          gifDetailModuleRoute,
          child: (context, args) => GifDetailPage(gifData: args.data),
        ),
      ];
}
