import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/playquiz.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  TeacherDetails td;
  Attendance(this.td);
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            ListTile(
              title: GestureDetector(
                onTap: (){
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now()
                  ).then((value)  {
                    setState(() {
                      _dateTime = value;
                    });
                  });
                },
                  child: Text(_dateTime == null ? "Select todays date" : _dateTime.toLocal().toString())
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: null,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height *7/10,
              // height: double.infinity,
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
                            uid: course["UserID"]
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("DOne");
        },
      ),
    );;
  }
}




class StudentTile extends StatefulWidget {
  final String fname, rollno,lname, uid;
  StudentTile({this.fname, this.rollno, this.lname,this.uid});

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
              print(widget.uid);
            });
          },
        ),
      ),
    );
  }
}
