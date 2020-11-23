import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/playquiz.dart';
import 'package:classroom/widgets/appBar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  final TeacherDetails td;
  Attendance(this.td);
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Branch")
            .doc(widget.td.branch)
            .collection(widget.td.sem)
            .doc(widget.td.div)
            .collection("Student").orderBy("RollNo").snapshots(),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot course = snapshot.data.documents[index];
                    return StudentTile(
                        rollno: course['RollNo'],
                      name: course["FirstName"]
                        );
                  });
        },
      ),
    );
  }

  // @override
  // void initState() {
  //   databaseService.getQuizData().then((val) {
  //     setState(() {
  //       quizStream = val;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
          color: kSecondaryColor.withOpacity(0.01), child: quizList()),
      //floatingActionButton: FloatingActionButton(
      // backgroundColor: kPrimaryColor,
      // child: Icon(Icons.add),
      // onPressed: () {
      //  Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => CreateQuiz()));
      // },
    );
  }
}



class StudentTile extends StatefulWidget {
  final String name, rollno;
  StudentTile({this.name, this.rollno});

  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  @override
  Widget build(BuildContext context) {
    return
    //   GestureDetector(
    //   onTap: () {
    //     print(name);
    //   },
    //   child: Container(
    //     // child: Stack(),
    //     child: Text(rollno),
    //   ),
    // );
    ToggleButtons(
        children: [
          Text(widget.rollno),
        ],
        isSelected: [
          false
        ],
        onPressed: (index) {
          print(widget.name);
        },
    );
  }
}
