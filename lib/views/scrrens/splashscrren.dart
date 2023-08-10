import 'dart:async';

import 'package:animation_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

class splashscrren extends StatefulWidget {
  const splashscrren({Key? key}) : super(key: key);

  @override
  State<splashscrren> createState() => _splashscrrenState();
}

class _splashscrrenState extends State<splashscrren> {
  void changeScreen() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
      });
    });

    Timer.periodic(
      const Duration(seconds: 3),
          (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.homepage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Image.asset("assets/images/p2.png",fit: BoxFit.cover,
                ),
                const Spacer(),
                const Spacer(),
                CircularProgressIndicator(
                  backgroundColor: Colors.blue.shade200,
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
