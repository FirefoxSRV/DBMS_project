import 'package:flutter/material.dart';
import 'Screens/mainScreen.dart';
import 'Screens/personScreen.dart';
import 'Screens/managerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      // home:ManagerScreen()
    );

  }
}
