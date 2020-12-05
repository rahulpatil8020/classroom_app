import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignmentQuestions extends StatefulWidget {
  final String assignId;
  AssignmentQuestions(this.assignId);
  @override
  _AssignmentQuestionsState createState() => _AssignmentQuestionsState();
}

class _AssignmentQuestionsState extends State<AssignmentQuestions> {
  Stream quesstionStream;
  DatabaseService databaseService = new DatabaseService();

  Widget queList(assignId) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Assignments")
            .doc(assignId)
            .collection("Questions Data")
            .snapshots(),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot course = snapshot.data.documents[index];
                    return QuestionTile(course['Question']);
                  });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Assignment"),
      body: queList(widget.assignId),
    );
  }
}

class QuestionTile extends StatelessWidget {
  final String que;
  QuestionTile(this.que);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        height: 150,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          que,
          style: TextStyle(fontSize: 20),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
