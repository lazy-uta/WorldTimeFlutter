import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Jakarta', flag: 'indonesia.png', url : 'Asia/Jakarta');
    await instance.getTime();
    print(instance.time);
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location' : instance.location,
     'flag' : instance.flag,
     'time' : instance.time,
     'isDaytime' : instance.isDayTime
   });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print('Hey there');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),

      )
    );
  }
}
