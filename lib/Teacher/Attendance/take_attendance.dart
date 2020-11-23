import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/playquiz.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/widgets.dart';

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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                        fname: course["FirstName"],
                        lname: course["LastName"],
                          );
                    });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("DOne");
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
  final String fname, rollno,lname;
  StudentTile({this.fname, this.rollno, this.lname});

  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  bool _attendance = true;
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
    // ToggleButtons(
    //     children: [
    //       Text(widget.rollno),
    //     ],
    //     isSelected: [
    //       false
    //     ],
    //     onPressed: (index) {
    //       print(widget.name);
    //     },
    // );
    Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: _attendance ?[Color.fromRGBO(2, 170, 176, 0.5),Color.fromRGBO(0, 205, 172,0.5)]: [Color.fromRGBO(221, 94, 137, 0.7),Color.fromRGBO(247, 187, 151,0.7)],
          )
        ),
        child: ListTile(
          leading: CircleAvatar(
            // backgroundImage: NetworkImage(),
            backgroundColor:_attendance ? Colors.green : Colors.red.shade400,
            child: Text(widget.rollno,
              style: TextStyle(
                color: _attendance ? Colors.black : Colors.white,
                fontSize: 18,
              ),

            ),
          ),
          title: Container(

              child: Text("${widget.fname} ${widget.lname}", style: TextStyle(fontSize: 20),)
          ),
          subtitle: Text("Roll Number : ${widget.rollno}",style: TextStyle(fontSize: 15),),
          onTap: (){
            setState(() {
              _attendance = !_attendance;
            });
          },
        ),
      ),
    );
  }
}
