import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PasswordBox extends StatefulWidget {

  PasswordBox({Key? key,required this.inputController}) : super(key: key);
  TextEditingController inputController;
  @override
  State<PasswordBox> createState() => _PasswordBoxState(inputController);
}

class _PasswordBoxState extends State<PasswordBox> {

  late TextEditingController inputController;

  _PasswordBoxState(this.inputController);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, //for now, dimensions are statically set
      width: 40,
      // We get access to keyBoard type and input formatters in  TextFormField
      child: TextFormField(
        obscureText: true,
        controller: inputController,
        decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.grey), borderRadius: BorderRadius.circular(12)),
            //when u click on the box, u can see the blue border rather than the grey one
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.blue), borderRadius: BorderRadius.circular(12))),
        onChanged: (value) {
          //If the value is filled, cursor moves on to next
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0) {
            FocusScope.of(context).previousFocus();
          }
        },

        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          //only 1 input per box allowed
          LengthLimitingTextInputFormatter(1),
          //only numbers allowed
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}



