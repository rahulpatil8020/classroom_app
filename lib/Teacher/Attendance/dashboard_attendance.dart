import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DashboardAttendance extends StatefulWidget {
  TeacherDetails td;
  DashboardAttendance({this.td});
  @override
  _DashboardAttendanceState createState() => _DashboardAttendanceState();
}

class _DashboardAttendanceState extends State<DashboardAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppbarLG(context),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            customContainerDashboard(),

          ],
        ),
      ),
    );
  }
}
