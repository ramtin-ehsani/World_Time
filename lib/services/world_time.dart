import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location;
  String time;
  String url;
  String flag;
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map map = jsonDecode(response.body);

      String dateTime = map['datetime'];
      String offset = map['utc_offset'];
      String hourOffset = offset.substring(1,3);
      String minuteOffset = offset.substring(4,6);

      DateTime now = DateTime.parse(dateTime);
      print(now);

      now = now.add(Duration(hours: int.parse(hourOffset),minutes: int.parse(minuteOffset)));

      isDayTime = now.hour>6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
      print(url);

    }catch(e){
      time = 'Someting went wrong...';
    }


  }
}