import 'package:flutter/material.dart';
// import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class CustomAppBar extends StatefulWidget {

  final VoidCallback toggleSidebar;
  final String appBarName;

  const CustomAppBar({Key? key, required this.toggleSidebar,required this.appBarName});

  @override
  _CustomAppBarState createState() => _CustomAppBarState(appBarName,toggleSidebar);
}

class _CustomAppBarState extends State<CustomAppBar> with SingleTickerProviderStateMixin{

  late final AnimationController _appBarAnimationController;
  final VoidCallback toggleSidebar;
  final String appBarName;

  _CustomAppBarState(this.appBarName,this.toggleSidebar);

  @override
  void initState() {
    _appBarAnimationController=AnimationController(
        vsync: this,
        lowerBound: -1,
        value: 0,
        upperBound: 1,
        duration: const Duration(seconds: 5)
    )..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _appBarAnimationController.forward(from: -1);
      }
    });

    _appBarAnimationController.forward();

    super.initState();
  }

  @override
  void dispose(){
    _appBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
          return AnimatedBuilder(
              animation: _appBarAnimationController,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)
                        ]
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:55.0),
                          child: Text(appBarName,textAlign: TextAlign.center,style: GoogleFonts.quicksand(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w700),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              builder: (context,child) {
                return ClipPath(
                  clipper: AppBarCustomClipper(_appBarAnimationController.value),
                  child: child,
                );
              }
          );
        }
    );
  }
}


class AppBarCustomClipper extends CustomClipper<Path>{

  double controllerValue=0;

  AppBarCustomClipper(this.controllerValue);

  @override
  Path getClip(Size size) {
    Path path=Path();
    path.lineTo(0, size.height-20);
    path.quadraticBezierTo((size.width/2)+(size.width*0.5*math.sin(controllerValue*math.pi)),(size.height*0.5*math.cos(controllerValue*math.pi))+100, size.width, size.height-20);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
