import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendanceDisplay extends StatefulWidget {
  TeacherDetails td;
  String date,sid;
  AttendanceDisplay(this.td, this.date,this.sid);
  @override
  _AttendanceDisplayState createState() => _AttendanceDisplayState();
}

class _AttendanceDisplayState extends State<AttendanceDisplay> {
  DatabaseService databaseService = DatabaseService();
  QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection("Branch")
        .doc(widget.td.branch)
        .collection(widget.td.sem)
        .doc(widget.td.div)
        .collection("Teacher")
        .doc(widget.td.uid)
        .collection("Attendance").doc(widget.td.subject)
        .collection(widget.date);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Absent Students"),
      ),
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data.docs[index];
                if(!snapshot.hasData){
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("LOADING....."),
                        ),
                      ],
                    ),
                  );
                } else
                  if(course["Status"] == "Absent") {
                      return Column(
                      children: [
                        StudentsDisplayAttandanceChanges(
                          rollno: course['RollNumber'],
                          name: course["Name"],
                          date: course["Data"],
                          status: course["Status"],
                          branch: widget.td.branch,
                          div: widget.td.div,
                          sem: widget.td.sem,
                          subject: course["Subject"],
                          tid: widget.td.uid,
                          time: course["Time"],
                          uid: course["UID"],
                        ),

                      ],
                    );
                  } else return null;
                  //   Container(
                  //   child: Center(
                  //     child: Text("Everyone is present"),
                  //   ),
                  // );
              },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done_all_outlined),
      ),
    );
  }
}










class StudentsDisplayAttandanceChanges extends StatefulWidget {
  String name, date, rollno, status, subject, branch, div, sem, tid, uid;
  String time;
  StudentsDisplayAttandanceChanges(
      {this.status, this.time, this.subject, this.date, this.rollno, this.name, this.uid, this.tid, this.div, this.sem, this.branch});
  @override
  _StudentsDisplayAttandanceChangesState createState() => _StudentsDisplayAttandanceChangesState();
}

class _StudentsDisplayAttandanceChangesState extends State<StudentsDisplayAttandanceChanges> {
  DatabaseService databaseService = DatabaseService();
  bool attendance;
  String updatedattendance;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if(widget.status == "Absent"){
        attendance = false;
      }
      else attendance = true;
    });
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: attendance
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
            backgroundColor: attendance ? Colors.green : Colors.red.shade400,
            child: Text(widget.rollno),
          ),
          title: Text(widget.name),
          subtitle: Text(widget.status),
            onTap: (){
            setState(() {
              if(widget.status == "Absent"){
                updatedattendance = "Absent";
                Map <String, dynamic> update = {
                  "Status" : "Present",
                };
                Map<String, dynamic> attendaceDetails = {
                  "RollNumber": widget.rollno,
                  "Data": widget.date,
                  "Status": "Present",
                  "Name": widget.name,
                  "Time": widget.time,
                  "Subject": widget.subject,
                  "UID": widget.uid,
                };

                databaseService.addStudentsAttandanceDetailsSubject(
                  branch: widget.branch,
                  semester: widget.sem,
                  div: widget.div,
                  date: widget.date,
                  status: "Present",
                  studentId: widget.uid,
                  subject: widget.subject,
                  studentData: attendaceDetails,
                );
                databaseService.updateStudentsAttandanceDetailsSubject(
                    branch: widget.branch,
                    semester: widget.sem,
                    div: widget.div,
                    teacherId: widget.tid,
                    rollno: widget.rollno,
                    date: widget.date,
                    subject: widget.subject,
                    studentData: update
                );
                databaseService.updateStudentsAttandanceDetailsSubjectStudents(
                    branch: widget.branch,
                    semester: widget.sem,
                    div: widget.div,
                    studentId: widget.uid,
                    date: widget.date,
                    subject: widget.subject,
                    status: widget.status,
                    studentData: update
                );
                databaseService.deleteStudentsAttandanceDetailsSubject(
                    branch: widget.branch,
                    semester: widget.sem,
                    div: widget.div,
                    studentId: widget.uid,
                    date: widget.date,
                    subject: widget.subject,
                    status: updatedattendance,
                );

              } else {
                updatedattendance = "Present";
                Map <String, dynamic> update = {
                  "Status" : "Absent",
                };
                Map<String, dynamic> attendaceDetails = {
                  "RollNumber": widget.rollno,
                  "Data": widget.date,
                  "Status": "Absent",
                  "Name": widget.name,
                  "Time": widget.time,
                  "Subject": widget.subject,
                  "UID": widget.uid,
                };

                databaseService.addStudentsAttandanceDetailsSubject(
                  branch: widget.branch,
                  semester: widget.sem,
                  div: widget.div,
                  date: widget.date,
                  status: "Absent",
                  studentId: widget.uid,
                  subject: widget.subject,
                  studentData: attendaceDetails,
                );
                databaseService.updateStudentsAttandanceDetailsSubject(
                    branch: widget.branch,
                    semester: widget.sem,
                    div: widget.div,
                    teacherId: widget.tid,
                    rollno: widget.rollno,
                    date: widget.date,
                    subject: widget.subject,
                    studentData: update);
                databaseService.updateStudentsAttandanceDetailsSubjectStudents(
                    branch: widget.branch,
                    semester: widget.sem,
                    div: widget.div,
                    studentId: widget.uid,
                    date: widget.date,
                    subject: widget.subject,
                    status: widget.status,
                    studentData: update
                );
                databaseService.deleteStudentsAttandanceDetailsSubject(
                    branch: widget.branch,
                    semester: widget.sem,
                    div: widget.div,
                    studentId: widget.uid,
                    date: widget.date,
                    subject: widget.subject,
                    status: updatedattendance,
                    studentData: update
                );
              }
            });
              print(widget.name);
            },
        )
    ));
  }
}





// class StudentsDisplayAttandanceChanges extends StatefulWidget {
//   final String rollno,
//       name,
//       date,
//       sub,
//       branch,
//       div,
//       sem,status,uid,
//       tid;
//   bool datasend;
//   String time;
//   StudentsDisplayAttandanceChanges(
//       { this.rollno,
//         this.name,
//         this.time,
//         this.status,
//         this.date,
//         this.sem,
//         this.branch,
//         this.div,
//         this.uid,
//         this.sub,
//         this.datasend,
//         this.tid});
//
//   @override
//   _StudentsDisplayAttandanceChangesState createState() => _StudentsDisplayAttandanceChangesState();
// }
//
// class _StudentsDisplayAttandanceChangesState extends State<StudentsDisplayAttandanceChanges> {
//   TeacherDetails td;
//   List<bool> isSelected;
//   bool _attendance = false;
//   String checka, delete;
//   DatabaseService databaseService = new DatabaseService();
//
//   uploadAttendanceData() async {
//     Map<String, dynamic> attendaceDetails = {
//       "RollNumber": widget.rollno,
//       "Data": widget.date,
//       "Status": widget.status,
//       "Name": widget.name,
//       "Time": widget.time,
//       "Subject": widget.sub,
//     };
//
//     databaseService.addStudentsAttandanceDetailsSubject(
//       branch: widget.branch,
//       semester: widget.sem,
//       div: widget.div,
//       date: widget.date,
//       status: widget.status,
//       studentId: widget.uid,
//       subject: widget.sub,
//       studentData: attendaceDetails,
//     );
//
//     databaseService
//         .showStudentsAttandanceDetailsSubject(
//       branch: widget.branch,
//       semester: widget.sem,
//       div: widget.div,
//       teacherId: widget.tid,
//       studentId: widget.uid,
//       date: widget.date,
//       studentData: attendaceDetails,
//       subject: widget.sub,
//     )
//         .then((value) {
//       print("Completed");
//     });
//   }
//
//   deleteAttendanceData() async {
//     databaseService.deleteStudentsAttandanceDetailsSubject(
//       branch: widget.branch,
//       semester: widget.sem,
//       div: widget.div,
//       date: widget.date,
//       status: delete,
//       studentId: widget.uid,
//       subject: widget.sub,
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     isSelected = [false, false];
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // if(widget.status == "Absent"){
//     //   _attendance = false;
//     // } else _attendance = true;
//     return
//       //   GestureDetector(
//       //   onTap: () {
//       //     print(name);
//       //   },
//       //   child: Container(
//       //     // child: Stack(),
//       //     child: Text(rollno),
//       //   ),
//       // );
//       Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               gradient: LinearGradient(
//                 colors: _attendance
//                     ? [
//                   Color.fromRGBO(2, 170, 176, 0.5),
//                   Color.fromRGBO(0, 205, 172, 0.5)
//                 ]
//                     : [
//                   Color.fromRGBO(221, 94, 137, 0.7),
//                   Color.fromRGBO(247, 187, 151, 0.7)
//                 ],
//               )),
//           child: ListTile(
//             leading: CircleAvatar(
//               // backgroundImage: NetworkImage(),
//               backgroundColor: _attendance ? Colors.green : Colors.red.shade400,
//               child: Text(
//                 widget.rollno,
//                 style: TextStyle(
//                   color: _attendance ? Colors.black : Colors.white,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             title: Container(
//                 child: Text(
//                   widget.name,
//                   style: TextStyle(fontSize: 20),
//                 )),
//             subtitle: Text(
//               "Roll Number : ${widget.rollno}",
//               style: TextStyle(fontSize: 15),
//             ),
//             onTap: (){
//               setState(() {
//                 _attendance = !_attendance;
//               });
//             },
//
//           ),
//         ),
//       );
//   }
// }
//



































//   children: [
//     Text(
//       "P",
//       style: _attendance
//           ? TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
//           : TextStyle(fontSize: 15),
//     ),
//     Text(
//       "A",
//       style: _attendance
//           ? TextStyle(fontSize: 15)
//           : TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//     )
//   ],
//   isSelected: isSelected,
//   color: Colors.white,
//   selectedColor: Colors.black,
//   fillColor: _attendance ? Colors.green : Colors.red.shade400,
//   onPressed: (index) {
//     setState(() {
//       for (int i = 0; i < isSelected.length; i++) {
//         if (i == index) {
//           isSelected[i] = true;
//           if (i == 1) {
//             if (checka == null) {
//               status = "Absent";
//               checka = status;
//               _attendance = false;
//               print(status);
//               print(widget.date);
//               print(widget.uid);
//               print(widget.rollno);
//               uploadAttendanceData();
//             } else {
//               print("*-------State Changed to absent--------*");
//               status = "Absent";
//               delete = "Present";
//               checka = status;
//               _attendance = false;
//
//               print(status);
//               print(widget.sub);
//               print(widget.date);
//               print(widget.uid);
//               print(widget.rollno);
//               uploadAttendanceData();
//               deleteAttendanceData();
//             }
//           } else {
//             if (checka == null) {
//               _attendance = true;
//               status = "Present";
//               checka = status;
//               print("*------------------------*");
//               print(status);
//               print(widget.date);
//               print(widget.uid);
//               print(widget.rollno);
//               uploadAttendanceData();
//               print("***********************************");
//             } else {
//               _attendance = true;
//               status = "Present";
//               delete = "Absent";
//               print("*-------State Changed to present--------*");
//               print(status);
//               print(widget.date);
//               print(widget.uid);
//               print(widget.rollno);
//               print("****************");
//               uploadAttendanceData();
//               deleteAttendanceData();
//             }
//           }
//         } else {
//           isSelected[i] = false;
//         }
//       }
//     });
//   },
// ),