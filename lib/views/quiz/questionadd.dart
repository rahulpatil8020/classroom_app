import 'package:classroom/services/database.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  uploadQuestion() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> quizMap = {
        "Question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
      };

      databaseService.addQuestionData(quizMap, widget.quizId).then((value) {
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
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: Column(
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
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Option 1" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Option 1 (Answer)",
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
                          option1 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Option 2" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Option 2",
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
                          option2 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Option 3" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Option 3",
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
                          option3 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Option 4 (Optional)",
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
                          option4 = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Spacer(),
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            uploadQuestion();
                          },
                          child: customButton(context, "Add Question",
                              MediaQuery.of(context).size.width / 2 - 30),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        GestureDetector(
                          onTap: () {
                            // hostQuiz();
                            Navigator.pop(context);
                          },
                          child: customButton(context, "Submit",
                              MediaQuery.of(context).size.width / 2 - 30),
                        ),
                      ]),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
