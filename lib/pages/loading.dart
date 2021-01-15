import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime timeintance = WorldTime(location: 'Nigeria', flag:'nigeria.jpg', url:'Africa/Lagos');
    await timeintance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': timeintance.location,
      'time': timeintance.time,
      'flag': timeintance.flag,
      'theDayTime': timeintance.theDayTime,
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
      backgroundColor: Colors.red[500],
      body:Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 50,
              ),
        ),
      ),
    );
  }
}

