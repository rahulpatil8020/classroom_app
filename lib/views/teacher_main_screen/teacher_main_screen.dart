import 'package:classroom/TEST/create_teacher_info.dart';
import 'package:classroom/TEST/display_subject_test.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/views/teacher_main_screen/create_assignment.dart';
import 'package:classroom/views/teacher_main_screen/create_notification.dart';
import 'package:classroom/views/teacher_main_screen/create_quiz.dart';
import 'package:classroom/views/teacher_main_screen/take_attendance.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/homeScreenBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher_Info")
            .doc(widget.td.email)
            .snapshots(),
        builder: (context, snapshot) {
          widget.td.fname = snapshot.data["first_name"];
          widget.td.lname = snapshot.data["last_name"];
          widget.td.mname = snapshot.data["middle_name"];
          widget.td.password = snapshot.data["password"];
          widget.td.email = snapshot.data["Email"];
          // widget.td.pickeddate = snapshot.data["DOB"];
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    homeScreenBox(
                        context, "Create Quiz", CreateQuiz(), 150, 150, 25),
                    homeScreenBox(context, "Post Assignment",
                        CreateAssignments(), 150, 150, 25)
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
                    homeScreenBox(context, "Test",
                        TestTeacherDetails(widget.td), 150, 150, 25),
                    homeScreenBox(context, "Display Teacher Subject List",
                        DisplaySubjectList(widget.td), 150, 150, 25)
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.td.fname);
        },
      ),
      // homeScreenBox(context, "Create Assignment", CreateAssignments())
    );
  }
}
