import 'dart:math';

import 'package:animation_app/controllers/planetscontroller.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:provider/provider.dart';

import '../../controllers/themeController.dart';

class detailpage extends StatefulWidget {
  const detailpage({Key? key}) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage>
    with SingleTickerProviderStateMixin {
  late AnimationController ani;
  late Animation planetRotation;
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    ani =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    planetRotation = Tween<double>(begin: 10, end: 10).animate(ani);
    ani.repeat(reverse: false);
    ani.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Provider.of<ThemeProvider>(context, listen: false)
                .changeTheme();
          }, icon: Icon(Icons.nights_stay_outlined))
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text("Planet detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<PlanetsController>(builder: (context, pro, _) {
          return SizedBox(
            height: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),),
              child: Center(
                child: Consumer<PlanetsController>(builder: (context, pro, _) {
                  return SingleChildScrollView(
                    child: Column(
                          children: [
                            Align(
                                child: Transform.rotate(
                                  angle: ani.value * 2 * pi,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Image.network(
                                      "${pro.planets[index]['image']}",
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ),
                            ),
                            const Divider(color: Colors.black26,),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Planets Name: - ${pro.planets[index]['name']}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Divider(color: Colors.black26,),
                            Padding(
                              padding: const EdgeInsets.only(left: 14,right: 14),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Planets velocity: - ${pro.planets[index]['velocity']}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(color: Colors.black26,),
                            Padding(
                              padding: const EdgeInsets.only(left: 14,right: 14),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Planets distance: - ${pro.planets[index]['distance']}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(color: Colors.black26,),
                            Padding(
                              padding: const EdgeInsets.only(left: 14,right: 14),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Planets description: - ${pro.planets[index]['description']}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                    ),
                  );
                },
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
