import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class chooselocation extends StatefulWidget {
  const chooselocation({ Key? key }) : super(key: key);

  @override
  State<chooselocation> createState() => _chooselocationState();
}

class _chooselocationState extends State<chooselocation> {

  List<worldTime> locations = [
	    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
	    worldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.jpg'),
	    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
	    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
	    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
	    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
	    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'southkorea.jpg'),
	    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpg'),
	  ];

    void updateTime(index) async{
     worldTime instance = locations[index];
     await instance.getTime();
     //nagivate to home screen
     Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
     });
    }

  @override
  Widget build(BuildContext context) {
     print('build function ran');
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length,
           itemBuilder:(context,index){
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
               child: Card(
                 child: ListTile(
                   onTap: (){
                     updateTime(index);
                   //print(locations[index].location);  
                   },
                   title: Text(locations[index].location),
                   leading: CircleAvatar(
                     backgroundImage: AssetImage('images/${locations[index].flag}'),
                   ),
                 ),
               ),
             );
           }
       ),
    );
  }
}