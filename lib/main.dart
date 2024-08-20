import 'package:flutter/material.dart';
import 'package:project2/activity/home.dart';
import 'package:project2/activity/loading.dart';
import 'package:project2/activity/location.dart';
void main() {
  runApp(MaterialApp(

    routes:{
      "/":(context)=>loading(),
      "/home":(context)=>Home(),
      "/loading":(context)=>loading(),
    },

  ));
}

