import 'package:classroom/TEST/add_subject_test.dart';
import 'package:classroom/models/statechecker.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  final String title;
  final TeacherDetails td;
  final Widget _widget;
  final IsCompleted ic;
  SubjectList(this.td, this.title, this._widget, this.ic);
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  // var;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "${widget.title}"),
      // AppBar(
      //   title: Text(widget.title),
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(widget.td.email)
            .collection("Subject_Data")
            .snapshots(),
        builder: (context, snapshot) {
          return Container(
            color: Colors.black,
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data.documents[index];
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                } else {
                  return GestureDetector(
                    onTap: () async {
                      // if(widget.ic.isCompleted == false) {
                      widget.td.branch = course["Branch"];
                      widget.td.div = course["Division"];
                      widget.td.subject = course["Subject"];
                      widget.td.sem = course["Semester"];
                      print(widget.td.subject);
                      print(widget.td.branch);
                      print(widget.td.sem);
                      print(widget.td.div);
                      print(widget.td.uid);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget._widget));
                      // }
                      // else {
                      //   final action = await Dialogs.yesAbortDialog(context, "WARNING", "Do you want to save and proceed further?");
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
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
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
