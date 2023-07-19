import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/world_time.dart';
import '../pages/home.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  Future<void> setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/');
    await instance.getTime();
    Object arguments = {
      'location': instance.location,
      'time': instance.time,
      'url': instance.url,
    };
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(), settings: RouteSettings(arguments: arguments)));
  }

  @override
  void initState() {
    // to still continue even if a request is sent
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}