import 'package:classroom/Teacher/Attendance/display_attendance_list.dart';
import 'package:classroom/Teacher/Attendance/take_attendance.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardAttendance extends StatefulWidget {
  TeacherDetails td;
  DashboardAttendance({this.td});
  @override
  _DashboardAttendanceState createState() => _DashboardAttendanceState();
}

class _DashboardAttendanceState extends State<DashboardAttendance> {
  DateTime _currentDate;

  @override
  void initState() {
    // TODO: implement initState
    _currentDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _fd = DateFormat.yMMMd().format(_currentDate);
    CollectionReference users = FirebaseFirestore.instance
        .collection("Branch")
        .doc(widget.td.branch)
        .collection(widget.td.sem)
        .doc(widget.td.div)
        .collection("Teacher")
        .doc(widget.td.uid)
        .collection("Attendance").doc(widget.td.subject)
        .collection(_fd);
    return Scaffold(
      appBar: getCustomAppbarLG(context),
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else return Container(
          padding: EdgeInsets.all(20),
          color: Colors.black,
          child: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              GestureDetector(
                onTap: (){
                  _pickDate();
                  print(users.get().toString());
                },
                  child: takeAttendanceContainerDashboard(context)
              ),
              GestureDetector(
                onTap: (){
          _pickDate();
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //         // AttendanceDisplay(widget.td)));
          //         AttendanceDisplay(widget.td, _fd, uid)));
          },
                  child: showAttendanceContainerDashboard(context)
              ),

            ],
          ),
        );
        },
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        // initialDate: DateTime(DateTime.now().day - 1),
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        _currentDate = date;
        print(_currentDate);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Attendance(widget.td, _currentDate)));
      });
    }
  }
}
