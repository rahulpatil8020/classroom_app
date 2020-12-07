import 'package:classroom/Teacher/Attendance/display_attendance_list.dart';
import 'package:classroom/Teacher/Attendance/show_attendance.dart';
import 'package:classroom/Teacher/Attendance/take_attendance.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/views/quiz/TESTQUIZ/add_quiz_details.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardQuiz extends StatefulWidget {
  TeacherDetails td;
  DashboardQuiz({this.td});
  @override
  _DashboardQuizState createState() => _DashboardQuizState();
}

class _DashboardQuizState extends State<DashboardQuiz> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(context, "Quiz DashBoard"),
      body: Container(
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                // AttendanceDisplay(widget.td)));
                                CreateQuizTEST(widget.td)));
                        // Navigator.CreateQuizTEST(widget.td)

                      },
                      child: takeQuizContainerDashboard(context, "Create New Quiz")
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: (){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         // AttendanceDisplay(widget.td)));
                        //         AttendanceDisplay(widget.td, _fd, uid)));
                        //
                      },
                      child: showQuizResultContainerDashboard(context, "Edit Quiz")
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                      onTap: (){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         // AttendanceDisplay(widget.td)));
                        //         AttendanceDisplay(widget.td, _fd, uid)));
                        //
                      },
                      child: showQuizContainerDashboard(context, "See Result")
                  ),




                ],
              ),
            ),
    );
  }
}




