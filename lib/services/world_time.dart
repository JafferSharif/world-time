import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class WorldTime {
  String location;  //location name for the UI
  String time;   //the time in that location
  String flag;  //url to an asset flag icon
  String url;  //location url for the api endpoint
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    //var response= await http.get(Uri.encodeFull(url), headers: {"Accept":"application/json"});
    //print(response.body);
    try{
      http.Response response= await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      //print(data);

      String datetime = data["datetime"];

      String offset=data["utc_offset"].substring(1,3);

      //create DateTime object
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //set the time property
      isDaytime=(now.hour>6 && now.hour<19) ? true:false;
      time=DateFormat.jm().format(now);

    }
    catch(e){
      print('caught error: $e');
      time='could not get time data';
    }



  }

}

