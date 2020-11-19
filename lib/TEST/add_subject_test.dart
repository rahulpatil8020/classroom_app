import 'package:classroom/TEST/display_subject_test.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/teacher_main_screen/teacher_main_screen.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddSubjectTest extends StatefulWidget {
  final TeacherDetails td;
  AddSubjectTest(this.td);
  @override
  _AddSubjectTestState createState() => _AddSubjectTestState();
}

class _AddSubjectTestState extends State<AddSubjectTest> {
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  uploadQuestion() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> subjectMap = {
        "Subject": widget.td.subject,
        "Semester": widget.td.sem,
        "Branch": widget.td.branch,
        "Division": widget.td.div,
      };

      databaseService.addSubjectData(subjectMap, widget.td.email).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AddSubjectTest(widget.td)));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _isLoading
      //     ? Container(
      //         child: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       )
      appBar: AppBar(
        title: Text("Welcome ${widget.td.fname}"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter Subject" : null;
                      },
                      initialValue: widget.td.subject,
                      decoration: InputDecoration(
                        hintText: "Subject",
                      ),
                      onChanged: (val) {
                        widget.td.subject = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem(
                            value: "Computer Engineering",
                            child: Text("Computer Engineering")),
                        DropdownMenuItem(value: "E&TC", child: Text("E&TC")),
                        DropdownMenuItem(
                            value: "Mechanical Engineering",
                            child: Text("Mechanical Engineering")),
                        DropdownMenuItem(
                            value: "Civil Engineering",
                            child: Text("Civil Engineering")),
                        DropdownMenuItem(
                            value: "Chemical Engineering",
                            child: Text("Chemical Engineering")),
                      ],
                      validator: (val) {
                        if (val == null) {
                          return "Select Branch";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          widget.td.branch = val;
                          print(widget.td.branch);
                        });
                      },
                      hint: Text("Branch"),
                      value: widget.td.branch,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem(value: "Sem 1", child: Text("Sem 1")),
                        DropdownMenuItem(value: "Sem 2", child: Text("Sem 2")),
                        DropdownMenuItem(value: "Sem 3", child: Text("Sem 3")),
                        DropdownMenuItem(value: "Sem 4", child: Text("Sem 4")),
                        DropdownMenuItem(value: "Sem 5", child: Text("Sem 5")),
                        DropdownMenuItem(value: "Sem 6", child: Text("Sem 6")),
                        DropdownMenuItem(value: "Sem 7", child: Text("Sem 7")),
                        DropdownMenuItem(value: "Sem 8", child: Text("Sem 8")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          widget.td.sem = val;
                          print(widget.td.sem);
                        });
                      },
                      validator: (val) {
                        if (val == null) {
                          return "Select Semester";
                        } else {
                          return null;
                        }
                      },
                      hint: Text("Semester"),
                      value: widget.td.sem,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem(value: "A", child: Text("A")),
                        DropdownMenuItem(value: "B", child: Text("B")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          widget.td.div = val;
                          print(widget.td.div);
                        });
                      },
                      validator: (val) {
                        if (val == null) {
                          return "Select Division";
                        } else {
                          return null;
                        }
                      },
                      hint: Text("Division"),
                      value: widget.td.div,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          uploadQuestion();
                          print(widget.td.subject);
                          print(widget.td.branch);
                          print(widget.td.sem);
                          print(widget.td.div);

                          _showAlertDialog("Subject Added",
                              "Subject: ${widget.td.subject}\n ${widget.td.branch}\n ${widget.td.sem}\n ${widget.td.div}\n");
                        },
                        child: customButton(context, "Add Subject",
                            MediaQuery.of(context).size.width / 2 - 30),
                      ),
                    ]),
                    SizedBox(
                      height: 100,
                    ),

                    StreamBuilder(
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
                 print("Tapped")
                },
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
              );
            },
          );
        },
      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done_outline),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TeacherMainScreen(widget.td)));
            print("Pressed");
          }
        },
      ),
    );
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
