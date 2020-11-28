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
          if(!snapshot.hasData) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final c = snapshot.data.docs;
          List <AttendanceModel> dataList = [];
          for(var tasksData in c) {
            var taskDetails = tasksData.data();
            print(taskDetails);
            dataList.add(
              AttendanceModel(
                subject: c["Subject"],
                status: c["Status"],
                date: c["Data"],
                currentDate: c["Time"],
                name: c["Name"],
                rollno: c["RollNumber"]
              ),
            );
          }


          return ListView.separated(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return dataList[index];
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1.0,
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



class AttendanceModel extends StatefulWidget {
  String name, rollno, date;
  Timestamp currentDate;
  String status, subject;

  AttendanceModel({
    this.name,
    this.rollno,
    this.date,
    this.currentDate,
    this.status,
    this.subject});
  @override
  _AttendanceModelState createState() => _AttendanceModelState();
}

class _AttendanceModelState extends State<AttendanceModel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),

      child: ListTile(
        title: Text(widget.name),
        leading: CircleAvatar(
          // backgroundImage: NetworkImage(),
          backgroundColor: widget.status == "Absent"  ? Colors.green : Colors.red.shade400,
          child: Text(widget.rollno,
            style: TextStyle(
              color: widget.status == "Absent" ? Colors.black : Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        subtitle: Text(widget.date),
      ),
    );
  }
}
