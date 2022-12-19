import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/personScreen.dart';



class NameCard extends StatelessWidget {
  final String name;
  final String roll;
  final String url;
  final String instaId;
  final String IQ;
  final String about;
  const NameCard({Key? key,required this.name,required this.roll,required this.url,required this.instaId,required this.IQ,required this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonScreen(name: name, url: url,instaId: instaId,IQ: IQ,about: about,)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.09,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style:GoogleFonts.quicksand(fontSize: 15,color: Colors.white) ,),
              Text(roll,style:GoogleFonts.quicksand(fontSize: 15,color: Colors.white) ,)
            ],
          ),
        ),

      ),
    );
  }
}
