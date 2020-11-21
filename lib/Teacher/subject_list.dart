import 'package:classroom/TEST/add_subject_test.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  final String title;
  final TeacherDetails td;
  final Widget _widget;
  SubjectList(this.td, this.title, this._widget);
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Teacher_Info")
            .doc(widget.td.email)
            .collection("Subject_Data")
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot course = snapshot.data.documents[index];
              return GestureDetector(
                onTap: () {
                  widget.td.branch = course["Branch"];
                  widget.td.div = course["Division"];
                  widget.td.subject = course["Subject"];
                  widget.td.sem = course["Semester"];
                  widget.td.uid = course.id;
                  print(widget.td.subject);
                  print(widget.td.branch);
                  print(widget.td.sem);
                  print(widget.td.div);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widget._widget));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      // child: Text(widget.td.div.substring(0, 1)),
                      child: Text(course["Division"]),
                      backgroundColor: Colors.black,
                    ),
                    // title: Text(widget.td.subject),
                    title: Text(course["Subject"]),
                    subtitle: Text(
                        "Semister: ${course["Semester"]}   Branch: ${course["Branch"]}"),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
