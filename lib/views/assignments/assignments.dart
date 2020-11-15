import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/assignments/assignment_questions.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  final String email;
  Assignments(this.email);
  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  Stream assignmentStream;
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot studentSnapshot;

  Stream<DocumentSnapshot> provideDocumentFieldStream(String email) {
    return FirebaseFirestore.instance
        .collection('Student Info')
        .doc(email)
        .snapshots();
  }

  Widget studentDetails(String email) {
    return StreamBuilder(
        stream: provideDocumentFieldStream(email),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> documentFields = snapshot.data.data();
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              child: assignmentList(documentFields['Branch'],
                  documentFields['Semister'], documentFields['Division']),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Text("No Assignments"),
            );
          }
        });
  }

  Widget assignmentList(String branch, String semister, String div) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Branch")
            .doc(branch)
            .collection(semister)
            .doc(div)
            .collection("Assignments")
            .snapshots(),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot course = snapshot.data.documents[index];
                    return AssignmentTile(
                      course['assignmentTitle'],
                      course['assignmentId'],
                      course['assignmentSubject'],
                      course['assignmentDescr'],
                    );
                  });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
          color: kSecondaryColor.withOpacity(0.01),
          child: studentDetails(widget.email)),
    );
  }
}

class AssignmentTile extends StatelessWidget {
  final String title, id, subject, descr;
  AssignmentTile(this.title, this.id, this.subject, this.descr);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AssignmentQuestions(id)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: kSecondaryColor.withOpacity(0.2), width: 2)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        subject,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "TITLE : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kPrimaryColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: kSecondaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "DESCRIPTION : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: kPrimaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Text(
                            descr,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: kSecondaryColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
