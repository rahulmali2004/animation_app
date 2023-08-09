import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/planetscontroller.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with SingleTickerProviderStateMixin{
  late AnimationController ani;
  late Animation planetRotation;
  @override
  void initState() {
    super.initState();
    ani = AnimationController(vsync: this,duration: const Duration(seconds: 4));
    planetRotation = Tween<double>(begin: 10,end: 10).animate(ani);
    ani.repeat(reverse: false);
    ani.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )
        ),
        title: const Text(
          "Galaxy Planets"
        ),
        centerTitle: true,
      ),
      body: Consumer<PlanetsController>(
        builder: (context,pro,_) {
          return ListView.builder(itemBuilder: (context, index) {
            return  Container(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'detailpage',arguments: index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 80,top: 20,bottom: 20,right: 20),
                      height: 150,
                      width: 500,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 150,
                            width: 200,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Text("${pro.planets[index]['position']}",style: TextStyle(fontSize: 30,color: Colors.white,),textAlign: TextAlign.left,),
                                      Spacer(),
                                      Icon(Icons.more_vert_outlined,color: Colors.white30,size: 20,)
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("Planets Galaxy",style: TextStyle(fontSize: 15,color: Colors.white54,),textAlign: TextAlign.left,)),
                                Divider(color: Colors.blue,thickness: 2,endIndent: 150,),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,color: Colors.white38,size: 18,),
                                    Text("${pro.planets[index]['name']}",style: TextStyle(fontSize: 20,color: Colors.white,),textAlign: TextAlign.center,),
                                    Spacer(),
                                    Icon(Icons.arrow_downward_outlined,color: Colors.white38,size: 18,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff434273),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12,blurRadius: 10,spreadRadius: 5)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 10),
                    child: Transform.rotate(
                      angle: ani.value*2*pi,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.network("${pro.planets[index]['image']}",height: 105,width: 105,),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },itemCount: pro.planets.length);
        }
      ),
    );
  }
}
