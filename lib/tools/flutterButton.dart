import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class uiButton extends StatelessWidget {
  final String text;

  final AlertDialog alertDialog;
  const uiButton({Key? key, required this.text,required this.alertDialog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => alertDialog);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
                begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)])),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
