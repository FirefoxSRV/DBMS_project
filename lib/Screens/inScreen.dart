import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class inScreen extends StatelessWidget {

  final GoogleSignInAccount user;
  final VoidCallback onpress;
  const inScreen({Key? key,required this.user,required this.onpress}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: InkWell(
              onTap: onpress,
              child: Icon(Icons.exit_to_app_rounded,color: Colors.white,)
          ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              // ListTile(
              //   leading:GoogleUserCircleAvatar(identity: user) ,
              //   title: Text(user.displayName?.split(' ')[0] ?? ''),
              //   subtitle: Text(user.email),
              // ),
              // MaterialButton(
              //   color: Colors.white,
              //   onPressed: onpress,
              //   child: Text("SIGN OUT",style: TextStyle(color: Colors.red),),
              // )
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: AnimatedTextKit(
                    pause: Duration(milliseconds: 1000),
                    isRepeatingAnimation: true,
                    animatedTexts:[
                  TyperAnimatedText("Welcome ${user.displayName?.split(" ")[0]} !",textStyle: GoogleFonts.quicksand(color: Colors.white,fontSize: 30),)
                ] ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: CircleAvatar(
                  child: GoogleUserCircleAvatar(
                    identity: user,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child:Text("Manage",style: GoogleFonts.quicksand(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child:Text("Use",style: GoogleFonts.quicksand(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),),
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
      ),
    );
  }
}
