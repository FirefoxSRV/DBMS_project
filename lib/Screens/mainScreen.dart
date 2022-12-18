import 'dart:async';

import 'package:flutter/material.dart';
import 'inScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dbms/tools/NameCard.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController scrollController = ScrollController();
  GoogleSignInAccount? _currentUser;
  bool isLoading=false;
  bool _isVisible=true;
  Timer? timer;
  void fadeInOut(){
    setState((){
      _isVisible=!_isVisible;
    });
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        isLoading=false;
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();

    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1000), (Timer t) => fadeInOut());
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    GoogleSignInAccount? user = _currentUser;
    // isLoading=false;
    late String greet;
    int dayHour = DateTime.now().hour;
    if (dayHour >= 0 && dayHour < 12) {
      greet = "Good Morning";
    } else if (dayHour >= 12 && dayHour < 18) {
      greet = "Good Afternoon";
    } else if (dayHour >= 18 && dayHour < 24) {
      greet = "Good Evening";
    }
    if (user != null) {
      return inScreen(user: user, onpress: signOut);
    } else {
      return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFF27121),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                Container(
                  // height: MediaQuery.of(context).size.height*2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Container(
                        child: Icon(
                          Icons.personal_injury,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Center(
                        child: Text(
                          "ROAD ACCIDENT REPORTS",
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.03), color: Colors.white),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  child: Text(
                                    greet,
                                    style: GoogleFonts.quicksand(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                ),

                                InkWell(

                                  onTap: () async{
                                    setState(() {
                                      isLoading = true;

                                    });
                                    signIn();

                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)])),
                                    child:isLoading?Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(strokeWidth: 1,color: Colors.white,),
                                    ): Padding(
                                      padding: EdgeInsets.all(19),
                                      child: Center(
                                        child: Text(
                                          "Login using Google Account",
                                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // MaterialButton(
                                //   color: Colors.white,
                                //   onPressed: (){
                                //      signIn();
                                //   },
                                //   child: Text("Click for Signing in",style: TextStyle(color: Colors.pink),),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      InkWell(
                        onTap: (){
                          scrollController.animateTo(MediaQuery.of(context).size.height*0.7, duration: Duration(milliseconds: 3000), curve: Curves.easeInOutCubicEmphasized);
                        },
                        child: Column(
                          children: [
                            Container(
                              child: Text("CREDITS",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 40),),
                            ),
                            AnimatedOpacity(opacity: _isVisible?0.9:0.2,duration: Duration(milliseconds: 400),
                            child: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey.shade200,size: 40,)
                            ),
                            AnimatedOpacity(opacity: _isVisible?0.2:0.9,duration: Duration(milliseconds: 400),
                                child: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey.shade200,size: 40,)),
                            AnimatedOpacity(opacity: _isVisible?0.3:0.9,duration: Duration(milliseconds: 800),
                                child: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey.shade200,size: 40,))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
                // SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  height: MediaQuery.of(context).size.height*0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NameCard(
                          name: "K Ganesh",
                          roll: "CB.EN.U4CSE21426",
                          url: "images/ganesh_pic.png",
                          instaId: "@K_Ganesh_19",
                          IQ: "458",
                            about: "Shrey is an aspiring student who wishes to gain more knowledge with insane precision to upgrade his brain. After spending couple of decades in the planet, this creature has become fiercer and more lovable over time 😊."
                        ),
                        NameCard(
                          name: "Akhila Pavani",
                          roll: "CB.EN.U4CSE21433",
                          url: "images/akhila_pic.jpg",
                          instaId: "_.kundla_.akhila._",
                          IQ: "567",
                            about: "Shrey is an aspiring student who wishes to gain more knowledge with insane precision to upgrade his brain. After spending couple of decades in the planet, this creature has become fiercer and more lovable over time 😊."
                        ),
                        NameCard(
                          name: "Ramnaresh U",
                          roll: "CB.EN.U4CSE21447",
                          url: "images/ram_pic.jpg",
                          instaId: "@ramnareesh",
                          IQ: "439",
                            about: "Shrey is an aspiring student who wishes to gain more knowledge with insane precision to upgrade his brain. After spending couple of decades in the planet, this creature has become fiercer and more lovable over time 😊."
                        ),
                        NameCard(
                          name: "Sanjay B",
                          roll: "CB.EN.U4CSE21453",
                          url: "images/sanjay_pic.jpg",
                          instaId: "@sanjayb_29",
                          IQ: "569",
                            about: "Shrey is an aspiring student who wishes to gain more knowledge with insane precision to upgrade his brain. After spending couple of decades in the planet, this creature has become fiercer and more lovable over time 😊."
                        ),
                        NameCard(
                          name: "Shreyas V",
                          roll: "CB.EN.U4CSE21455",
                          url: "images/shrey_pic.jpg",
                          instaId: "@qwerty._.fox",
                          IQ: "As much as the reader",
                          about: "Shrey is an aspiring student who wishes to gain more knowledge with insane precision to upgrade his brain. After spending couple of decades in the planet, this creature has become fiercer and more lovable over time 😊.",
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )),
      );
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<bool> signIn() async {
    try {
      await _googleSignIn.signIn();
      if(_currentUser?.displayName == null){
        setState(() {
          isLoading=false;
        });
      }
      return true;
    } catch (e) {
      print("Error signing in $e");
      isLoading=false;
      final shouldPop= await showDialog<bool>(
        context: context,
        builder: (context) {


          return AlertDialog(
            title: const Text('No Internet !'),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: () {
                  setState((){
                    isLoading=false;
                  });
                  Navigator.pop(context, true);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return shouldPop!;
    }
  }
}



