import 'package:flutter/material.dart';
import '../tools/custom_app_bar.dart';
import '../tools/flutterButton.dart';
import 'package:google_fonts/google_fonts.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  State<adminScreen> createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              title: const Text('Do you want to go back?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              content: Text("On going back, you will need to re-enter the password !"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Ok'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No,I will stay'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            CustomAppBar(toggleSidebar: () {}, appBarName: "Welcome Administrator"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 4, child: SizedBox()),
                    Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Expanded(flex: 4, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 4,
                        child: uiButton(
                          alertDialog: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            title: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'CREATE COMMAND',
                                  style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                )),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            content: SingleChildScrollView(
                              child: Container(
                                // height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: [
                                    Text(
                                      "Table Name",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Attributes",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Datatypes",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Ok',
                                        style: GoogleFonts.quicksand(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          text: "Create",
                        )),
                    Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Expanded(
                        flex: 4,
                        child: uiButton(
                          alertDialog: AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            title: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'SELECT COMMAND',
                                  style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                )),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            content: SingleChildScrollView(
                              child: Container(
                                // height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: [
                                    Text(
                                      "Table Name",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Attributes",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Conditions",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Ok',
                                        style: GoogleFonts.quicksand(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          text: "Display",
                        )),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 4,
                        child: uiButton(
                          alertDialog: AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            title: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'UPDATE COMMAND',
                                  style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                )),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            content: SingleChildScrollView(
                              child: Container(
                                // height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: [
                                    Text(
                                      "Table Name",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Attributes",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Values",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Conditions",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Ok',
                                        style: GoogleFonts.quicksand(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          text: "Update",
                        )),
                    Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Expanded(
                        flex: 4,
                        child: uiButton(
                          alertDialog: AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            title: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'ALTER COMMAND',
                                  style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                )),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            content: SingleChildScrollView(
                              child: Container(
                                // height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: [
                                    Text(
                                      "Table Name",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Attributes",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Keyword",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Conditions",
                                      style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    TextField(),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black, border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Ok',
                                        style: GoogleFonts.quicksand(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          text: "Alter",
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 4, child: SizedBox()),
                    Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Expanded(flex: 4, child: SizedBox()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
