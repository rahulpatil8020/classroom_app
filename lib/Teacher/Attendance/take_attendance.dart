import 'package:classroom/Teacher/Attendance/display_attendance_list.dart';
import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/attendanceData.dart';
import 'package:classroom/models/statechecker.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/playquiz.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/dialogs.dart';
import 'package:classroom/widgets/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Attendance extends StatefulWidget {
  TeacherDetails td;
  DateTime time;
  Attendance(this.td, [this.time]);
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  DateTime _currentDate, _previousDay;
  bool tapped = false;
  int lengthofDoc;

  @override
  void initState() {
    // TODO: implement initState
    _currentDate = widget.time;
    _previousDay = DateTime.now().subtract(Duration(days: 1));

    super.initState();
  }

  Widget build(BuildContext context) {
    String _fd = DateFormat.yMMMd().format(_currentDate);
    bool sendData = false;
    String uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Branch")
              .doc(widget.td.branch)
              .collection(widget.td.sem)
              .doc(widget.td.div)
              .collection("Student")
              .orderBy("RollNo")
              .snapshots(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Container(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot course =
                          snapshot.data.docs[index];
                      lengthofDoc = snapshot.data.docs.length;
                      uid = course["UserID"];
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: StudentTile(
                          rollno: course['RollNo'],
                          fname: course["FirstName"],
                          lname: course["LastName"],
                          uid: course["UserID"],
                          date: _fd,
                          datasend: sendData,
                          branch: widget.td.branch,
                          div: widget.td.div,
                          sem: widget.td.sem,
                          sub: widget.td.subject,
                          exacttym: _currentDate.toString(),
                          tid: widget.td.uid,
                        ),
                      );
                    });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () async {
          final action = await Dialogs.yesAbortDialog(
              context, "WARNING", "Do you want to save and proceed further?");
          if (action == DialogAction.yes) {
            setState(() {
              sendData = true;
            });
            // widget.ic.isCompleted = true;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        // AttendanceDisplay(widget.td)));
            AttendanceDisplay(widget.td, _fd, uid)));
            print("Data sent succesfully");
          }
          print("DOne");
          print(_fd);
          print(_fd.runtimeType);
          print(lengthofDoc);
        },
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        // initialDate: DateTime(DateTime.now().day - 1),
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        _currentDate = date;
        print(_currentDate);
      });
    }
  }
}

class StudentTile extends StatefulWidget {
  final String fname,
      rollno,
      lname,
      uid,
      date,
      sub,
      branch,
      div,
      sem,
      exacttym,
      tid;
  bool datasend;
  StudentTile(
      {this.fname,
      this.rollno,
      this.lname,
      this.uid,
      this.date,
      this.sem,
      this.branch,
      this.div,
      this.sub,
      this.exacttym,
      this.datasend,
      this.tid});

  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  TeacherDetails td;
  List<bool> isSelected;
  bool _attendance = false;
  String status, checka, delete;
  DatabaseService databaseService = new DatabaseService();

  uploadAttendanceData(String rollno) async {
    Map<String, dynamic> attendaceDetails = {
      "RollNumber": widget.rollno,
      "Data": widget.date,
      "Status": status,
      "Name": "${widget.fname} ${widget.lname}",
      "Time": widget.exacttym,
      "Subject": widget.sub,
      "UID": widget.uid
    };

    databaseService.addStudentsAttandanceDetailsSubject(
      branch: widget.branch,
      semester: widget.sem,
      div: widget.div,
      date: widget.date,
      status: status,
      studentId: widget.uid,
      subject: widget.sub,
      studentData: attendaceDetails,
    );

    databaseService
        .showStudentsAttandanceDetailsSubject(
      branch: widget.branch,
      semester: widget.sem,
      div: widget.div,
      teacherId: widget.tid,
      rollno: rollno,
      date: widget.date,
      studentData: attendaceDetails,
      subject: widget.sub,
    )
        .then((value) {
      print("Completed");
    });
  }

  deleteAttendanceData() async {
    databaseService.deleteStudentsAttandanceDetailsSubject(
      branch: widget.branch,
      semester: widget.sem,
      div: widget.div,
      date: widget.date,
      status: delete,
      studentId: widget.uid,
      subject: widget.sub,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [false, false];
    super.initState();
  }

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
        Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: _attendance
                  ? [
                      Color.fromRGBO(2, 170, 176, 0.5),
                      Color.fromRGBO(0, 205, 172, 0.5)
                    ]
                  : [
                      Color.fromRGBO(221, 94, 137, 0.7),
                      Color.fromRGBO(247, 187, 151, 0.7)
                    ],
            )),
        child: ListTile(
          leading: CircleAvatar(
            // backgroundImage: NetworkImage(),
            backgroundColor: _attendance ? Colors.green : Colors.red.shade400,
            child: Text(
              widget.rollno,
              style: TextStyle(
                color: _attendance ? Colors.black : Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          title: Container(
              child: Text(
            "${widget.fname} ${widget.lname}",
            style: TextStyle(fontSize: 20),
          )),
          subtitle: Text(
            "Roll Number : ${widget.rollno}",
            style: TextStyle(fontSize: 15),
          ),
          trailing: ToggleButtons(
            children: [
              Text(
                "P",
                style: _attendance
                    ? TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                    : TextStyle(fontSize: 15),
              ),
              Text(
                "A",
                style: _attendance
                    ? TextStyle(fontSize: 15)
                    : TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
            isSelected: isSelected,
            color: Colors.white,
            selectedColor: Colors.black,
            fillColor: _attendance ? Colors.green : Colors.red.shade400,
            onPressed: (index) {
              setState(() {
                for (int i = 0; i < isSelected.length; i++) {
                  if (i == index) {
                    isSelected[i] = true;
                    if (i == 1) {
                      if (checka == null) {
                        status = "Absent";
                        checka = status;
                        _attendance = false;
                        print(status);
                        print(widget.date);
                        print(widget.uid);
                        print(widget.rollno);
                        uploadAttendanceData(widget.rollno);
                      } else {
                        print("*-------State Changed to absent--------*");
                        status = "Absent";
                        delete = "Present";
                        checka = status;
                        _attendance = false;

                        print(status);
                        print(widget.sub);
                        print(widget.date);
                        print(widget.uid);
                        print(widget.rollno);
                        uploadAttendanceData(widget.rollno);
                        deleteAttendanceData();
                      }
                    } else {
                      if (checka == null) {
                        _attendance = true;
                        status = "Present";
                        checka = status;
                        print("*------------------------*");
                        print(status);
                        print(widget.date);
                        print(widget.uid);
                        print(widget.rollno);
                        uploadAttendanceData(widget.rollno);
                        print("***********************************");
                      } else {
                        _attendance = true;
                        status = "Present";
                        delete = "Absent";
                        print("*-------State Changed to present--------*");
                        print(status);
                        print(widget.date);
                        print(widget.uid);
                        print(widget.rollno);
                        print("****************");
                        uploadAttendanceData(widget.rollno);
                        deleteAttendanceData();
                      }
                    }
                  } else {
                    isSelected[i] = false;
                  }
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
