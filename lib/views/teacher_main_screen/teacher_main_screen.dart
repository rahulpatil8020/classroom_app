import 'package:classroom/TEST/create_teacher_info.dart';
import 'package:classroom/TEST/display_subject_test.dart';
import 'package:classroom/Teacher/Attendance/dashboard_attendance.dart';
import 'package:classroom/Teacher/Attendance/take_attendance.dart';
import 'package:classroom/Teacher/subject_list.dart';
import 'package:classroom/models/statechecker.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/views/quiz/TESTQUIZ/add_quiz_details.dart';
import 'package:classroom/views/quiz/TESTQUIZ/quiz_dashboard.dart';
import 'package:classroom/views/teacher_main_screen/create_assignment.dart';
import 'package:classroom/views/teacher_main_screen/create_notification.dart';
import 'package:classroom/views/teacher_main_screen/create_quiz.dart';

import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/homeScreenBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class TeacherMainScreen extends StatefulWidget {
  final TeacherDetails td;
  IsCompleted ic;
  TeacherMainScreen(this.td,[this.ic]);

  @override
  _TeacherMainScreenState createState() => _TeacherMainScreenState();
}

class _TeacherMainScreenState extends State<TeacherMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Home"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(widget.td.email)
            .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.data == null){
            return CircularProgressIndicator();
          } else {
          widget.td.fname = snapshot.data["first_name"];
          widget.td.lname = snapshot.data["last_name"];
          widget.td.mname = snapshot.data["middle_name"];
          widget.td.password = snapshot.data["password"];
          widget.td.email = snapshot.data["Email"];
          widget.td.uid = snapshot.data["UID"];
          // widget.td.pickeddate = snapshot.data["DOB"];

            return Container(
              color: Colors.black,
              child: GridView.count(
                crossAxisCount: 2,
                // mainAxisSpacing: 5,
                // crossAxisSpacing: 5,

                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CreateQuiz()));
                    },
                    child: displayListTeachers(
                        context,"Create Quiz",
                        [Color(0xffFF61D2),
                          Color(0xffFE9090),],
                      Colors.black
                    ),
                  ),

          GestureDetector(
          onTap: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateAssignments()));
          },
          child: displayListTeachers(
                      context,"Post Assignment",
                      [Color(0xffFF512F),
                        Color(0xffDD2476),],
                      Colors.white
                  ),
          ),

          GestureDetector(
          onTap: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => SubjectList(
              widget.td, "Attendance",
              DashboardAttendance(td: widget.td), widget.ic),));
          },
          child: displayListTeachers(
                      context,"Attendance",
                      [Color(0xffaa076b ),
                        Color(0xff61045f),],
                      Colors.white
                  ),
          ),

          GestureDetector(
          onTap: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateNotification()));
          },
          child: displayListTeachers(
                      context,"Notice",
                      [Color(0xff4568dc),
                        Color(0xffb06ab3),],
                      Colors.black
                  ),
          ),


          GestureDetector(
          onTap: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => SubjectList(
              widget.td, "Quiz",
              DashboardQuiz(td: widget.td,), widget.ic),));
          },
          child: displayListTeachers(
                      context,"Quiz TEST",
                      [Color(0xff185a9d),
                        Color(0xff43cea2),],
                      Colors.black
                  ),),

          GestureDetector(
          onTap: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => DisplaySubjectList(widget.td)));
          },
          child: displayListTeachers(
                      context,"Subject List",
                      [Color(0xff7b4397),
                        Color(0xffdc2430),],
                      Colors.white,
                  ),),

                  // homeScreenBox(
                  //     context, "Create Quiz", CreateQuiz(), 150, 150, 25),
                  // homeScreenBox(context, "Post Assignment",
                  //     CreateAssignments(), 150, 150, 25),
                  // homeScreenBox(
                  //     context, "Notice", CreateNotification(), 150, 150,
                  //     25),
                  // homeScreenBox(
                  //     context,
                  //     "Attendence",
                  //     SubjectList(
                  //         widget.td, "Attendance",
                  //         DashboardAttendance(td: widget.td), widget.ic),
                  //     // Attendance(widget.td,widget.ic)
                  //     150,
                  //     150,
                  //     25),
                  // homeScreenBox(context, "Test",
                  //     TestTeacherDetails(widget.td), 150, 150, 25),
                  // homeScreenBox(context, "Display Teacher Subject List",
                  //     DisplaySubjectList(widget.td), 150, 150, 25),


                ],
              ),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print(widget.td.fname);
      //     print(widget.td.email);
      //     print(widget.td.lname);
      //     print(widget.td.mname);
      //     print(widget.td.uid);
      //   },
      // ),
      // homeScreenBox(context, "Create Assignment", CreateAssignments())
    );
  }
}
