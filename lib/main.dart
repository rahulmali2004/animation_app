import 'package:animation_app/controllers/planetscontroller.dart';
import 'package:animation_app/views/scrrens/detailpage.dart';
import 'package:animation_app/views/scrrens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlanetsController(),
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const homepage(),
        'detailpage': (context) => const detailpage(),
      },
    );
  }
}
