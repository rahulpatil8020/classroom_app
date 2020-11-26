import 'package:flutter/material.dart';

class AttendanceDisplay extends StatefulWidget {
  @override
  _AttendanceDisplayState createState() => _AttendanceDisplayState();
}

class _AttendanceDisplayState extends State<AttendanceDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
