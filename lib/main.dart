import 'package:animation_app/controllers/planetscontroller.dart';
import 'package:animation_app/utils/MyRoutes.dart';
import 'package:animation_app/views/scrrens/detailpage.dart';
import 'package:animation_app/views/scrrens/homepage.dart';
import 'package:animation_app/views/scrrens/splashscrren.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/themeController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanetsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(prefs: pref),
        ),
      ],
      child: const MyAPP(),
    ),
  );
}

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      //Light Mode
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      // Dark Mode
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.SplashScreenPage,
      routes: {
        MyRoutes.SplashScreenPage: (context) => const splashscrren(),
        MyRoutes.homepage: (context) => const homepage(),
        MyRoutes.detailpage: (context) => detailpage(),
      },
    );
  }
}
