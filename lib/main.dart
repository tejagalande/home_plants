import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_plant/screen/home_screen.dart';
import 'package:home_plant/screen/welcome_screen.dart';

void main() {
  // var osVersion = Platform.o;
  // debugPrint("OS version: $osVersion");

  runApp(HomePlant());
} 

class HomePlant extends StatelessWidget {
  const HomePlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(BuildContext context) => WelcomeScreen(),
        '/home' :( BuildContext context ) => HomeScreen(),   
      },
      debugShowCheckedModeBanner: false,
      
    );
  }
}
