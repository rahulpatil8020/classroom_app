import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/questionModel.dart';
import 'package:classroom/models/subjectdetails.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/results.dart';
import 'package:classroom/views/teacher_main_screen/teacher_main_screen.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/quizplaywidget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplaySubjectList extends StatefulWidget {
  final TeacherDetails td;
  DisplaySubjectList(this.td);
  @override
  _DisplaySubjectListState createState() => _DisplaySubjectListState();
}

class _DisplaySubjectListState extends State<DisplaySubjectList> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionsSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // questionsSnapshot == null
            // ? Container(
            //     child: Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //   ):
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Teacher_Info")
                    .doc(widget.td.email)
                    .collection("Subject_Data")
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.data == null
                      ? Container()
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot course =
                                snapshot.data.documents[index];
                            return DisplaySubjectTile(
                             branch: course["Branch"],
                             div: course["Division"],
                             sem: course["Semester"],
                             sub: course["Subject"],
                            );
                          });
                })

            // : ListView.builder(
            //     itemCount: questionsSnapshot.docs.length,
            //     itemBuilder: (context, index) {
            //       return DisplaySubjectTile(
            //         getQuestionModelFromDatasnapshot(
            //             questionsSnapshot.docs[index]),
            //         index,
            //       );.
            //     },
            //   ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => TeacherMainScreen(widget.td)));
        },
      ),
    );
  }
}

class DisplaySubjectTile extends StatefulWidget {
  final String sub, sem,div,branch;

  DisplaySubjectTile({this.sem, this.branch,this.div,this.sub});

  @override
  _DisplaySubjectTileState createState() => _DisplaySubjectTileState();
}

class _DisplaySubjectTileState extends State<DisplaySubjectTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Subjects'),
      ),
      body: Container(child : Column(children: [
          CircleAvatar(
            child: Text(widget.div.substring(0, 1)),
          ),
          Text(widget.sub),
              Text("Semister: ${widget.sem}   Branch: ${widget.branch}"),
      ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.branch);
          print(widget.sub);
        },
      ),
    );
  }
}
