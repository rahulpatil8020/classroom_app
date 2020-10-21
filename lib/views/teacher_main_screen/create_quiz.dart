import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/questionadd.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizTitle, quizDescription, quizId;
  String quizImageUrl = "";
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  hostQuiz() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImageURL": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription,
      };

      databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddQuestion(quizId)));
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
                        validator: (val) {
                          if (val.isEmpty) {
                            return null;
                          } else {
                            return "https://images.unsplash.com/photo-1579548122080-c35fd6820ecb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ";
                          }
                        },
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Quiz Image URL",
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
                          quizImageUrl = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Quiz Title" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Quiz Title",
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
                          quizTitle = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Description" : null,
                        cursorColor: Colors.blue,
                        style: TextStyle(
                          color: Color.fromRGBO(244, 180, 0, 1),
                          decorationColor: Color.fromRGBO(66, 133, 244, 1),
                          fontSize: 19,
                          // backgroundColor: Colors.blue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Quiz Description",
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
                          quizDescription = val;
                        },
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          hostQuiz();
                        },
                        child: blueButton(context, "Create Quiz"),
                      ),
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
