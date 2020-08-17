import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {


  void setupWorldTime() async{
    WorldTime instance=WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  /*String url='http://worldtimeapi.org/api/timezone/Asia/Kolkata';
  Future<String> getTime() async {
    var response= await http.get(Uri.encodeFull('http://worldtimeapi.org/api/timezone/Asia/Kolkata'), headers: {"Accept":"application/json"});
    print(response.body);

    /*http.Response response= await http.get('https://randomuser.me/api/');
    Map data=jsonDecode(response.body);
    print(data);*/

    /*String datetime = data["datetime"];

    String offset=data["utc_offset"].substring(1,3);

    //create DateTime object
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
    print(now);*/

    //set the time property
    //time=now.toString();



  }*/

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 80.0,
          controller: AnimationController(vsync: this,duration: const Duration(milliseconds: 1200)),
        ),
      )
    );
  }
}
