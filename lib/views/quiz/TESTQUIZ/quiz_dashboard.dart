import 'package:classroom/Teacher/Attendance/display_attendance_list.dart';
import 'package:classroom/Teacher/Attendance/show_attendance.dart';
import 'package:classroom/Teacher/Attendance/take_attendance.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/views/quiz/TESTQUIZ/add_quiz_details.dart';
import 'package:classroom/views/quiz/TESTQUIZ/edit_quiz_questions_test.dart';
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                // AttendanceDisplay(widget.td)));
                                EditQuizData(widget.td)));
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


class EditQuizData extends StatefulWidget {
  TeacherDetails td;
  EditQuizData(this.td);
  @override
  _EditQuizDataState createState() => _EditQuizDataState();
}

class _EditQuizDataState extends State<EditQuizData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Edit Quiz"),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Branch")
              .doc(widget.td.branch)
              .collection(widget.td.sem)
              .doc(widget.td.div)
              .collection("Quiz").orderBy("quizDeadlineDate").snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot course =
                  snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        subtitle: Text(course["quizDescription"], style: TextStyle(color: Colors.yellow, fontSize: 18),),
                        title: Text(course["quizTitle"],style: TextStyle(color: Colors.blue,fontSize: 23),),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditQuestion(widget.td, course["quizId"])));
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}


class EditQuestion extends StatefulWidget {
  TeacherDetails td;
  String quizID;
  EditQuestion(this.td, this.quizID);
  @override
  _EditQuestionState createState() => _EditQuestionState();
}

class _EditQuestionState extends State<EditQuestion> {
  DocumentReference documentReference;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Edit Quiz"),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Branch")
              .doc(widget.td.branch)
              .collection(widget.td.sem)
              .doc(widget.td.div)
              .collection("Quiz").doc(widget.quizID).collection("QuestionsData").snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot course =
                  snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        subtitle: Text("Answer: ${course["option1"]}", style: TextStyle(color: Colors.yellow, fontSize: 18),),
                        title: Text(
                          course["Question"],style: TextStyle(color: Colors.blue,fontSize: 23),),
                        onTap: (){
                          print("------------- tapped ---------------");
                          print(course.id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditQuestions(
                              widget.quizID,
                              course.id,
                              course["option3"],
                              course["option2"],
                              course["option1"],
                              course["Question"],
                              course["option4"],
                          widget.td.div,widget.td.branch,widget.td.sem)));
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}



