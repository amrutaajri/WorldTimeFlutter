import 'dart:html';

import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_loc.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
//import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    //home: Home(),
    initialRoute: '/',
    routes: {
      '/':(context) => loading(),
      '/home':(context) => Home(),
      '/location':(context) => chooselocation(),
    },
  ));
}

