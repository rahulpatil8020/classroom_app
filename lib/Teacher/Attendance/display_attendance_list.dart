import 'package:classroom/models/teachersignupdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceDisplay extends StatefulWidget {
  TeacherDetails td;
  String date,sid;
  AttendanceDisplay(this.td, this.date,this.sid);
  @override
  _AttendanceDisplayState createState() => _AttendanceDisplayState();
}

class _AttendanceDisplayState extends State<AttendanceDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance of Student"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Branch")
            .doc(widget.td.branch)
            .collection(widget.td.sem)
            .doc(widget.td.div)
            .collection("Teacher")
            .doc(widget.td.uid)
            .collection("Attendance").doc(widget.td.subject)
            .collection(widget.date)
            .doc(widget.sid).snapshots(),
        builder: (context, snapshot){
          return snapshot.data == null
              ? Container(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot course = snapshot.data.documents[index];
              return ListTile(
                leading: Text(course["RollNumber"]),
                title: Text(course["Name"]),
              );
            },
          );
        },
      ),

    );
  }
  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
