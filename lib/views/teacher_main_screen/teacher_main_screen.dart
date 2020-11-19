import 'package:classroom/TEST/create_teacher_info.dart';
import 'package:classroom/TEST/display_subject_test.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/views/teacher_main_screen/create_assignment.dart';
import 'package:classroom/views/teacher_main_screen/create_notification.dart';
import 'package:classroom/views/teacher_main_screen/create_quiz.dart';
import 'package:classroom/views/teacher_main_screen/take_attendance.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/homeScreenBox.dart';

import 'package:flutter/material.dart';

class TeacherMainScreen extends StatefulWidget {
  final TeacherDetails td;
  TeacherMainScreen(this.td);

  @override
  _TeacherMainScreenState createState() => _TeacherMainScreenState();
}

class _TeacherMainScreenState extends State<TeacherMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeScreenBox(
                      context, "Create Quiz", CreateQuiz(), 150, 150, 25),
                  homeScreenBox(context, "Post Assignment", CreateAssignments(),
                      150, 150, 25)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeScreenBox(

                      context, "Notice", CreateNotification(), 150, 150, 25),

                  homeScreenBox(
                      context, "Attendence", Attendance(), 150, 150, 25)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeScreenBox(
                      context, "Test", TestTeacherDetails(widget.td), 150, 150, 25),
                ],
              ),
            ],
          ),
        )
        // homeScreenBox(context, "Create Assignment", CreateAssignments())
        );
  }
}
