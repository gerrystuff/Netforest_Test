import 'package:flutter_modular/flutter_modular.dart';
import 'package:app/config/apis/app_http_manager.dart';
import 'package:app/pages/articles/ui/screens/articles_screen.dart' as articles_screen;
import 'package:app/pages/splash/ui/screens/page.dart' as init;

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppHttpManager(), isLazy: false),

        Bind.lazySingleton((i) => articles_screen.Bloc()),
      ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, __) =>  init.PageTest()),
    ChildRoute('/articles', child: (_, __) =>  articles_screen.ArticlesScreen(), transition: TransitionType.fadeIn),
  ];

 
}
