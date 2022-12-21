import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class PersonScreen extends StatelessWidget {
  final String name;
  final String url;
  final String instaId;
  final String IQ;
  final String about;
  PersonScreen({Key? key,required this.name,required this.url,required this.instaId,required this.IQ,required this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)])
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.keyboard_arrow_left_sharp,size: 40,)
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("My Profile",textAlign: TextAlign.center,style:GoogleFonts.quicksand(color: Colors.white,fontSize: 40) ,),
                  SizedBox(height: height*0.1,),
                  Container(
                    height: height*0.4,
                    child: LayoutBuilder(
                      builder: (context,constraints){
                        double innerHeight=constraints.maxHeight;
                        double innerWidth=constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom:0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: innerWidth,
                                height: innerHeight*0.65,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 50 ,),
                                    GradientText(
                                      name,
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700

                                      ), colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
                                    ),
                                    SizedBox(height: 20,),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center ,
                                          children: [
                                            Expanded(flex: 40,child: Center(child: Text(instaId,style: GoogleFonts.quicksand(color: Colors.grey[900],fontSize: 21),))),
                                            Expanded(child: Container(height: 85,width: 5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.grey),)),
                                            Expanded(flex: 40,child: Center(child: Column(
                                              children: [
                                                GradientText("IQ",style: GoogleFonts.quicksand(color: Colors.grey[900],fontSize: 31), colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],),
                                                Text(IQ,style: GoogleFonts.quicksand(color: Colors.grey[900],fontSize: 20)),
                                              ],
                                            )))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top:0,
                              left:0,
                              right:0,
                              child: Center(
                                child: Container(
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: CircleAvatar(
                                    radius:90,
                                    backgroundImage: AssetImage(url),
                                  ),
                                  // child: Image.asset(
                                  //   "images/ganesh_pic.png",fit: BoxFit.fitWidth,
                                  //   width:innerWidth*0.45,
                                  // )
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 25,),
                  Container(
                    width: width,
                    height: height*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        GradientText("ABOUT ME",style: GoogleFonts.quicksand(color: Colors.grey[900],fontSize: 30),colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)]),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(about,style: GoogleFonts.quicksand(color: Colors.grey[900],fontSize: 20)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
