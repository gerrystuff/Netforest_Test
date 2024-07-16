import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/config/apis/app_http_manager.dart';
import 'package:app/config/module.dart';
import 'package:app/config/myapp.dart';
import 'package:app/config/shared_prefs/app_preferences.dart';
import 'package:app/config/flavors.dart';

void qaMain() { 
  main();
}

void devMain() { 
  main();
}

void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización de los plugins
  
  final prefs = AppPreferences();
  await prefs.initPrefs();


print("helo");
  await setFlavor();
  MyApp.instance.startInit();
  runApp(
    ModularApp(module: AppModule(), child: const NavigationApp())
  );
}


class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {

    Modular.get<AppHttpManager>().init(
      urlBackMobile: MyApp.instance.start.urlBackMobile!
    );
    
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Template App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),

    );
  }
}


