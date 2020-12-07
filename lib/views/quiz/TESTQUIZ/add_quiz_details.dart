import 'package:classroom/models/QuizModels/quiz_add_question_model.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/quiz/questionadd.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuizTEST extends StatefulWidget {
  final TeacherDetails td;
  CreateQuizTEST(this.td);
  @override
  _CreateQuizTESTState createState() => _CreateQuizTESTState();
}

class _CreateQuizTESTState extends State<CreateQuizTEST> {
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;
  String quizTitle, quizDescription, quizId, quizImageUrl, deadline;
  DateTime pickeddate;
  TimeOfDay time;
  TimeOfDay timeSelect = TimeOfDay.now();

  @override
  void initState() {
    // TODO: implement initState
    // widget.cqd.pickeddate = DateTime.now();
    widget.td.pickeddate = DateTime.now();
    super.initState();
  }

  hostQuiz() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      quizId = randomAlphaNumeric(16);
      Map<String, dynamic> quizMap = {
        "quizId": quizId,
        "quizImageURL": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription,
        "quizDeadlineDate" : widget.td.pickeddate,
        "quizDeadLineTime" : timeSelect.toString(),
      };

      print(quizId);
      print(quizDescription);
      print(quizImageUrl);
      print(quizTitle);
      print(widget.td.pickeddate);
      print(timeSelect);

      databaseService.addQuizDetails(quizMap, quizId,widget.td.branch,widget.td.sem,widget.td.div).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddQuestion(quizId, widget.td)));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,"Create Quiz"),
      body: _isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*14 /15,
              color: Colors.black,
              child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextFormField(
                cursorColor: Colors.blue,
                style: TextStyle(
                  color: Color.fromRGBO(244, 180, 0, 1),
                  decorationColor: Color.fromRGBO(66, 133, 244, 1),
                  fontSize: 19,
                  // backgroundColor: Colors.blue,
                ),
                decoration: InputDecoration(
                  labelText: "Quiz Image URL (Optional)",
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
                height: 20,
              ),
              TextFormField(
                // validator: (val) {
                //   if(val.isEmpty){
                //     return "Enter Quiz Title";
                //   } else return null;
                // },
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
                height: 20,
              ),
              TextFormField(
                // validator: (val) {
                //   if(val.isEmpty){
                //     return "Enter Description";
                //   } else return null;
                // },
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
              SizedBox(
                height: 20,
              ),
              // TextFormField(
              //   validator: (val) =>
              //   val.isEmpty ? "Enter Quiz Duration" : null,
              //   cursorColor: Colors.blue,
              //   style: TextStyle(
              //     color: Color.fromRGBO(244, 180, 0, 1),
              //     decorationColor: Color.fromRGBO(66, 133, 244, 1),
              //     fontSize: 19,
              //     // backgroundColor: Colors.blue,
              //   ),
              //   decoration: InputDecoration(
              //     labelText: "Quiz Deadline",
              //     labelStyle: TextStyle(
              //       fontSize: 18,
              //       color: Colors.blue,
              //     ),
              //     // fillColor: Colors.white,
              //     // filled: true,
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: const BorderSide(
              //           color: Colors.blueGrey, width: 2.0),
              //       borderRadius: BorderRadius.circular(25.0),
              //     ),
              //   ),
              //   onChanged: (val) {
              //     widget.cqd.deadline = val;
              //   },
              // ),

              // ListTile(
              //   leading: IconButton(
              //     icon: Icon(Icons.date_range, color: Colors.white,),
              //     onPressed: _pickDate,
              //   ),
              //   title: Text(
              //       "Date of Birth : ${widget.cqd.pickeddate.day}/${widget.cqd.pickeddate.month}/${widget.cqd.pickeddate.year}"),
              //   trailing: Icon(Icons.keyboard_arrow_down),
              //   onTap: _pickDate,
              // ),

              ListTile(
                leading: Icon(Icons.date_range, color: Colors.blueGrey,),
                title: Text(
                    "Date of Birth : ${widget.td.pickeddate.day}/${widget.td.pickeddate.month}/${widget.td.pickeddate.year}", style:  TextStyle(color: Colors.blue),),
                trailing: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey,),
                onTap: _pickDate,
              ),
              SizedBox(
                height: 20,
              ),

              ListTile(
                leading: Icon(Icons.date_range, color: Colors.blueGrey,),
                title: Text(
                  "Time : ${timeSelect.hour}:${timeSelect.minute}", style:  TextStyle(color: Colors.blue),),
                trailing: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey,),
                onTap: _pickedtime,
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
          ),
    );
  }


  // _pickDate() async {
  //   DateTime date = await showDatePicker(
  //       context: context,
  //       initialDate: widget.cqd.pickeddate,
  //       firstDate: DateTime(DateTime.now().year - 50),
  //       lastDate: DateTime.now());
  //
  //   if (date != null) {
  //     setState(() {
  //       widget.cqd.pickeddate = date;
  //       print(widget.cqd.pickeddate);
  //     });
  //   }
  // }


  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: widget.td.pickeddate,
        firstDate: DateTime.now(),
        lastDate:  DateTime(DateTime.now().year + 50));

    if (date != null) {
      setState(() {
        widget.td.pickeddate = date;
        pickeddate = date;
        print(pickeddate);
      });
    }
  }
  
  _pickedtime() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: timeSelect,
    );
    if(time != null){
      print(timeSelect.toString());
      setState(() {
        timeSelect = time;
      });
    }
  }

}




