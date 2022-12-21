import 'package:flutter/material.dart';
import 'Screens/mainScreen.dart';
import 'Screens/managerScreen.dart';
import 'Screens/personScreen.dart';
import 'Screens/adminScreen.dart';
import 'Screens/userScreen.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      // home:adminScreen(),
      // home: UserScreen(),
    );

  }
}
