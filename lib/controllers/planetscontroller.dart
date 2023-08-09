import 'dart:convert';

import 'package:animation_app/helper/planetshelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanetsController extends ChangeNotifier{
  List planets = [];

  int index = 0;

  PlanetsController(){
  planetsall();
  }

  planetindex(){
    index++;
    notifyListeners();

  }

  planetsall () async {
    planets = await planetsHelper.Planetshelper.loadString();
    notifyListeners();
  }
}