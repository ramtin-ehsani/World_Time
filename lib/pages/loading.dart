import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async{
    WorldTime worldTime = WorldTime(url: 'Asia/Tehran', location: 'Tehran', flag: 'tehran.png');
    await worldTime.getTime();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location':worldTime.location, 'time':worldTime.time, 'flag':worldTime.flag, 'isDayTime':worldTime.isDayTime
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
