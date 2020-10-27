import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/theme_service.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ThemeService.instance.changeThemeListener();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    ThemeService.instance.changeThemeListener();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return AnimatedBuilder(
      animation: ThemeService.instance,
      builder: (context, child) => MaterialApp(
        navigatorKey: Modular.navigatorKey,
        initialRoute: Modular.initialRoute,
        onGenerateRoute: Modular.generateRoute,
        theme: ThemeService.instance.currentTheme,
      ),
    );
  }
}
