import 'package:classroom/helper/constant.dart';
import 'package:flutter/material.dart';

Widget blueButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: kPrimaryColor,
      //  gradient: LinearGradient(
      //   colors: [
      //    Color.fromRGBO(66, 133, 244, 1),
      //   Color.fromRGBO(219, 68, 55, 1),
      //  Color.fromRGBO(244, 180, 0, 1),
      //     ],
      //begin: Alignment.centerLeft,
      //  end: Alignment.centerRight,
      //),
      borderRadius: BorderRadius.circular(30),
    ),
    height: 50,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}

Widget customButton(BuildContext context, String label, buttonWidth) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: kPrimaryColor,
      // gradient: LinearGradient(
      // colors: [
      //   Color.fromRGBO(66, 133, 244, 1),
      //   Color.fromRGBO(219, 68, 55, 1),
      //   Color.fromRGBO(244, 180, 0, 1),
      // ],
      // begin: Alignment.centerLeft,
      //  end: Alignment.centerRight,
      // ),
      borderRadius: BorderRadius.circular(30),
    ),
    height: 50,
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}

Widget inputTextStylingForm(
    BuildContext context, String label, String errorMessage) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      validator: (val) => val.isEmpty ? errorMessage : null,
      cursorColor: Colors.blue,
      style: TextStyle(
        color: Color.fromRGBO(244, 180, 0, 1),
        decorationColor: Color.fromRGBO(66, 133, 244, 1),
        fontSize: 20,
        // backgroundColor: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.blue,
        ),
        // fillColor: Colors.white,
        // filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onChanged: (val) {
        return val;
      },
    ),
  );
}
