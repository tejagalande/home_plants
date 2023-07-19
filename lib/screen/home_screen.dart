import 'package:flutter/material.dart';
import 'package:home_plant/screen/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  
  

  late BuildContext lastContext;

  Home({super.key, required this.lastContext});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName("/")),
         
        ),
      ),
      body: Container(
        color: Colors.pink.shade200,
      ),
    );
  }
}