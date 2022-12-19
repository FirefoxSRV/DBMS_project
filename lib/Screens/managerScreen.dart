import 'package:flutter/material.dart';
import '../tools/custom_app_bar.dart';


class ManagerScreen extends StatefulWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              CustomAppBar(toggleSidebar: (){}, appBarName: "Welcome Manager")
            ],
          ),
            
        )
    );
  }
}
