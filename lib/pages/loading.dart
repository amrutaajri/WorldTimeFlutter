import 'dart:html';

import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class loading extends StatefulWidget {
  const loading({ Key? key }) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void setupWorldTime() async{

    worldTime instance = worldTime(location: 'Dubai', flag: 'germany.png', url: 'Asia/Dubai');
    await instance.getTime();
   Navigator.pushNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }
  
  @override
  void initState() {
    super.initState();
    setupWorldTime();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, 
     body: Center(
       child: SpinKitRotatingCircle(
        color: Colors.white,
         size: 80.0,
      ),
     ),
    );
  }
  }
