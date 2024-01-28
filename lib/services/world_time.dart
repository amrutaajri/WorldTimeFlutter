import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {

  String location; //location name for the UI
  String time=""; // the time in that location
  String flag; //url to asset an flag icon
  String url; //location url for api endpoints
  late bool isDaytime; //true or flase if daytime or not

  worldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    //make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    //create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set a time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
worldTime instance = worldTime(location: 'Dubai', flag: 'germany.png', url: 'Asia/Dubai');
