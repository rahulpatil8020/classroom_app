import 'package:classroom/Teacher/Attendance/dashboard_attendance.dart';
import 'package:classroom/helper/constant.dart';
import 'package:flutter/cupertino.dart';
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

Widget customColorButton(BuildContext context, String label, buttonWidth, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: color,
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




Widget takeAttendanceContainerDashboard(BuildContext context, String name){
  return Container(
    // height: 20,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromRGBO(69, 104, 220, 1),
            // Color.fromRGBO(176, 106, 179, 1),
            Color(0xff2b5876),
            Color(0xff4e4376)
          ],
        )
    ),
    child: Text(name,
      style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    ),

  );
}


Widget showAttendanceContainerDashboard(BuildContext context, String name){
  return Container(
    // height: 20,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromRGBO(69, 104, 220, 1),
            // Color.fromRGBO(176, 106, 179, 1),
            Color(0xffff512f),
            Color(0xffdd2476)
          ],
        )
    ),
    child: Text(name,
      style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    ),

  );
}


Widget takeQuizContainerDashboard(BuildContext context, String name){
  return Container(
    height: 150,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromRGBO(69, 104, 220, 1),
            // Color.fromRGBO(176, 106, 179, 1),
            Color(0xff2b5876),
            Color(0xff4e4376)
          ],
        )
    ),
    child: Text(name,
      style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    ),

  );
}


Widget showQuizContainerDashboard(BuildContext context, String name){
  return Container(
    height: 150,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromRGBO(69, 104, 220, 1),
            // Color.fromRGBO(176, 106, 179, 1),
            Color(0xffff512f),
            Color(0xffdd2476)
          ],
        )
    ),
    child: Text(name,
      style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    ),

  );
}

Widget showQuizResultContainerDashboard(BuildContext context, String name){
  return Container(
    height: 150,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromRGBO(69, 104, 220, 1),
            // Color.fromRGBO(176, 106, 179, 1),
            Color(0xff4568dc),Color(0xffb06ab3)
          ],
        )
    ),
    child: Text(name,
      style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    ),

  );
}



Widget getCustomAppbarLG(BuildContext context){
  return PreferredSize(
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Color.fromRGBO(69, 104, 220, 1),
              // Color.fromRGBO(176, 106, 179, 1),
              Color(0xffc33764),
              Color(0xff1d2671)
            ],
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(11.5),
              child: Text("Attendance Dashboard",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(55)
  );
}