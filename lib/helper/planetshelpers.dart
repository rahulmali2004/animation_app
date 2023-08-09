import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart' as http;

class planetsHelper{
  planetsHelper._();

  static final planetsHelper Planetshelper = planetsHelper._();

  Future<List> loadString () async {
    String json = await rootBundle.loadString("assets/planets.json");
    print("==================${json}===========================================");
    List planet = jsonDecode(json);
    print("==================${planet}===========================================");
    return planet;
  }
}