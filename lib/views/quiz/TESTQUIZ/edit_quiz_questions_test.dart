import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditQuestions extends StatefulWidget {
  TeacherDetails td;
  final String quizId;
  String question, option1, option2, option3, option4, docId, branch,sem,div;
  EditQuestions(this.quizId, this.docId,this.option3,this.option2,this.option1,this.question,this.option4,this.div,this.branch,this.sem,[this.td]);
  @override
  _EditQuestionsState createState() => _EditQuestionsState();
}

class _EditQuestionsState extends State<EditQuestions> {
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  uploadQuestion() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> quizMap = {
        "Question": widget.question,
        "option1": widget.option1,
        "option2": widget.option2,
        "option3": widget.option3,
        "option4": widget.option4,
      };

      print(quizMap);
      // quizMap, widget.quizId,widget.td.branch,widget.td.sem,widget.td.div, widget.docId
      print(widget.quizId);
      print(widget.branch);
      print(widget.sem);
      print(widget.div);
      print(widget.docId);

      databaseService.updateQuizQuestionDetails(
          //
        quizMap,widget.quizId,widget.branch,widget.sem,widget.div,widget.docId
      ).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pop(context);
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
                  initialValue: widget.question,
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
                    widget.question = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.option1,
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
                    widget.option1 = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.option2,
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
                    widget.option2 = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.option3,
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
                    widget.option3 = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.option4,
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
                    widget.option4 = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    uploadQuestion();
                    print("---------------==========----------------");
                    // quizMap, widget.quizId,widget.td.branch,widget.td.sem,widget.td.div, widget.docId
                    print(widget.quizId);
                    print(widget.branch);
                    print(widget.sem);
                    print(widget.div);
                    print(widget.docId);
                  },
                  child: customButton(context, "Update Question",
                      MediaQuery.of(context).size.width / 2 - 30),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
      ),
    );
  }
}
