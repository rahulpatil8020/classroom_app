import 'package:classroom/services/database.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateAssignmentQuestions extends StatefulWidget {
  final String assignid, branch, semister, division;
  CreateAssignmentQuestions(
      this.assignid, this.branch, this.semister, this.division);
  @override
  _CreateAssignmentQuestionsState createState() =>
      _CreateAssignmentQuestionsState();
}

class _CreateAssignmentQuestionsState extends State<CreateAssignmentQuestions> {
  final _formKey = GlobalKey<FormState>();
  String question;
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  uploadQuestion() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> assignMap = {
        "Question": question,
      };
      databaseService.addAssignmentDataInBranch(assignMap, widget.assignid,
          widget.branch, widget.semister, widget.division);
      databaseService
          .addAssignQuestion(assignMap, widget.assignid)
          .then((value) {
        setState(() {
          _isLoading = false;
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => AddQuestion(quizId)));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, "Questions"),
        body: _isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Question" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Question",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                          // fillColor: Colors.white,
                          // filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onChanged: (val) {
                          question = val;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  uploadQuestion();
                                },
                                child: customButton(
                                    context, "Add Question", 180.0)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: customButton(
                                  context, "Submit Assignment", 180.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
