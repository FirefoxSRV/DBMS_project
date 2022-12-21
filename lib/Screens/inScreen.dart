import 'dart:ui';
import 'package:dbms/Screens/managerScreen.dart';
import 'package:dbms/Screens/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../tools/passwordBox.dart';
import 'adminScreen.dart';

class inScreen extends StatelessWidget {
  final GoogleSignInAccount user;
  final VoidCallback onpress;

  const inScreen({Key? key, required this.user, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> get = [];
    String passwordString = "";
    //Implement later
    // List<TextEditingController> PasswordDigit=[];
    TextEditingController PasswordDigit1 = TextEditingController();
    TextEditingController PasswordDigit2 = TextEditingController();
    TextEditingController PasswordDigit3 = TextEditingController();
    TextEditingController PasswordDigit4 = TextEditingController();
    TextEditingController PasswordDigit5 = TextEditingController();
    TextEditingController PasswordDigit6 = TextEditingController();
    late String greet;
    int dayHour = DateTime.now().hour;
    if (dayHour >= 0 && dayHour < 12) {
      greet = "Good Morning";
    } else if (dayHour >= 12 && dayHour < 18) {
      greet = "Good Afternoon";
    } else if (dayHour >= 18 && dayHour < 24) {
      greet = "Good Evening";
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: InkWell(
              onTap: onpress,
              child: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              )),
          actions: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: CircleAvatar(
                child: GoogleUserCircleAvatar(
                  identity: user,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),

                  AnimatedContainer(
                    height: 50,
                    curve: Curves.bounceIn,
                    duration: Duration(milliseconds: 100),
                    child: AnimatedTextKit(repeatForever: true,isRepeatingAnimation: true, animatedTexts: [
                      RotateAnimatedText(
                        duration:Duration(milliseconds: 1000),
                        greet,
                        textStyle: GoogleFonts.quicksand(color: Colors.white, fontSize: 30),
                      )
                    ]),
                  ),





                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  AnimatedTextKit(pause: Duration(milliseconds: 5000), animatedTexts: [
                    TyperAnimatedText(
                      speed:Duration(milliseconds: 100),
                      "Welcome ${user.displayName?.split(" ")[0]} !",
                      textStyle: GoogleFonts.quicksand(color: Colors.white, fontSize: 30),
                    )
                  ]),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(

                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    title: Text("Enter admin key :",style: GoogleFonts.quicksand(color: Colors.black87),),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Go to Tools/password_box for more info
                                        PasswordBox(inputController: PasswordDigit1),
                                        SizedBox(width: 1,),
                                        PasswordBox(inputController: PasswordDigit2),
                                        SizedBox(width: 1,),
                                        PasswordBox(inputController: PasswordDigit3),
                                        SizedBox(width: 1,),
                                        PasswordBox(inputController: PasswordDigit4),
                                        SizedBox(width: 1,),
                                        PasswordBox(inputController: PasswordDigit5),
                                        SizedBox(width: 1,),
                                        PasswordBox(inputController: PasswordDigit6),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          if(passwordString=="123456"){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return adminScreen();
                                            }));
                                          }
                                          passwordString = "";
                                          get = [];
                                          get.addAll([
                                            PasswordDigit1.text,
                                            PasswordDigit2.text,
                                            PasswordDigit3.text,
                                            PasswordDigit4.text,
                                            PasswordDigit5.text,
                                            PasswordDigit6.text
                                          ]);
                                          for (int i = 0; i < 6; i++) {
                                            passwordString += get[i];
                                          }
                                          if(passwordString=="123456"){
                                            Navigator.pop(context);
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return adminScreen();
                                            }));
                                          }else{
                                            showDialog(
                                                context: context,
                                                builder: (context)=>BackdropFilter(
                                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                  child: AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(30)
                                                    ),
                                                    title: Text("Wrong key. Try Again!",style: GoogleFonts.quicksand(fontWeight: FontWeight.w700),textAlign: TextAlign.center,),

                                                  ),
                                                )
                                            );
                                          }
                                          // Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(10)
                                          ),

                                          padding: const EdgeInsets.all(14),
                                          child: Text("okay",style: GoogleFonts.quicksand(color: Colors.white),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                            // Navigator.push(context, MaterialPageRoute(builder: (context){
                            //   return ManagerScreen();
                            // }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Administer",
                                    style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (context) => BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    title: Text("Where to ?",style: GoogleFonts.quicksand(color: Colors.black87),),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return ManagerScreen();
                                              }));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Manage",style: GoogleFonts.quicksand(color: Colors.white),),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(

                                          child: InkWell(
                                            onTap:(){
                                              Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return UserScreen();
                                              }));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("USE",style: GoogleFonts.quicksand(color: Colors.white),),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Use",
                                    style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


