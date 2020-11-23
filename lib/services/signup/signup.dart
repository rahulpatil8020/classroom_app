import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/student_info.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/auth.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/services/sign_in/signin.dart';
import 'package:classroom/views/main_screen.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../../widgets/appBar.dart';

class SignUp extends StatefulWidget {
  final TeacherDetails td;
  final StudentInfo si;
  SignUp(this.td, this.si);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  AuthService authService = new AuthService();
  bool _isloading = false;
  DatabaseService databaseService = new DatabaseService();
  DocumentReference df;
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isloading = true;
      });
      await authService
          .signUpWithEmailAndPassword(widget.si.email, widget.si.password)
          .then((value) {
            widget.si.uid = value.uid;
        if (value != null) {
          setState(() {
            _isloading = false;
          });
          HelperFunction.saveUserLoggedInDetails(isloggedin: true);
        }
      });

      Map<String, String> userMap = {
        "FirstName": widget.si.fname,
        "MiddleName": widget.si.mname,
        "LastName": widget.si.lname,
        "Email": widget.si.email,
        "RollNo": widget.si.rollno,
        "password": widget.si.password,
        "Dataofbirth": widget.si.pickeddate.toString(),
        "Branch": widget.si.branch,
        "Semister": widget.si.sem,
        "UserID": widget.si.uid,
        "Division": widget.si.div,
        "role": "Student",
      };
      databaseService.addUserData(userMap, widget.si.email);
      databaseService
          .addFieldsData(
              branch: widget.si.branch,
              div: widget.si.div,
              semester: widget.si.sem,
              studentEmail: widget.si.email,
              id: widget.si.uid,
              studentData: userMap)
          .then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MainScreen(widget.si)));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.si.pickeddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isloading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  height: size.height * 0.9,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Enter First Name" : null;
                          },
                          decoration: InputDecoration(
                            hintText: "First Name",
                          ),
                          onChanged: (val) {
                            widget.si.fname = val;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Enter Middle Name" : null;
                          },
                          decoration: InputDecoration(
                            hintText: "Middle Name",
                          ),
                          onChanged: (val) {
                            widget.si.mname = val;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Enter Last Name" : null;
                          },
                          decoration: InputDecoration(
                            hintText: "Last Name",
                          ),
                          onChanged: (val) {
                            widget.si.lname = val;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 152,
                            child: TextFormField(
                              validator: (val) {
                                return val.length <= 2 && val.isNotEmpty
                                    ? null
                                    : "Roll number should be of 2 digits";
                              },
                              decoration: InputDecoration(
                                hintText: "Roll No.(2 digit)",
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                widget.si.rollno = val;
                              },
                              cursorWidth: 10,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 152,
                            child: TextFormField(
                              validator: (val) {
                                return val == "A" || val == 'B'
                                    ? null
                                    : "Enter either A or B";
                              },
                              decoration: InputDecoration(
                                hintText: "Div.",
                              ),
                              onChanged: (val) {
                                widget.si.div = val;
                              },
                              cursorWidth: 10,
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        ListTile(
                          title: Text(
                              "Date of Birth : ${widget.si.pickeddate.day}/${widget.si.pickeddate.month}/${widget.si.pickeddate.year}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: _pickDate,
                        ),
                        DropdownButton<String>(
                          items: [
                            DropdownMenuItem(
                                value: "Computer Engineering",
                                child: Text("Computer Engineering")),
                            DropdownMenuItem(
                                value: "E&TC", child: Text("E&TC")),
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
                          onChanged: (val) {
                            setState(() {});
                            widget.si.branch = val;
                            print(widget.si.branch);
                          },
                          hint: Text("Branch"),
                          value: widget.si.branch,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        DropdownButton<String>(
                          items: [
                            DropdownMenuItem(
                                value: "Sem 1", child: Text("Sem 1")),
                            DropdownMenuItem(
                                value: "Sem 2", child: Text("Sem 2")),
                            DropdownMenuItem(
                                value: "Sem 3", child: Text("Sem 3")),
                            DropdownMenuItem(
                                value: "Sem 4", child: Text("Sem 4")),
                            DropdownMenuItem(
                                value: "Sem 5", child: Text("Sem 5")),
                            DropdownMenuItem(
                                value: "Sem 6", child: Text("Sem 6")),
                            DropdownMenuItem(
                                value: "Sem 7", child: Text("Sem 7")),
                            DropdownMenuItem(
                                value: "Sem 8", child: Text("Sem 8")),
                          ],
                          onChanged: (val) {
                            setState(() {
                              widget.si.sem = val;
                              print(widget.si.sem);
                            });
                          },
                          hint: Text("Semester"),
                          value: widget.si.sem,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          validator: (val) {
                            return isEmail(val)
                                ? null
                                : "Enter valid Email Address";
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            widget.si.email = val;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length < 6
                                ? "Enter Correct Password"
                                : null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                          onChanged: (val) {
                            widget.si.password = val;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.035,
                        ),
                        GestureDetector(
                          onTap: () {
                            signUp();
                            print("Clicked on Sign UP Gradient Button");
                          },
                          child: blueButton(context, "Sign Up"),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignIn(widget.td,widget.si)));
                                  print(
                                      "Clicked on Sign IN Already have account");
                                },
                                child: Text(
                                  "Already have an Account?",
                                  style: TextStyle(fontSize: 15),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignIn(widget.td,widget.si)));
                                  print("Clicked on Sign IN");
                                },
                                child: Text(
                                  " Sign In",
                                  style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: widget.si.pickeddate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        widget.si.pickeddate = date;
        print(widget.si.pickeddate);
      });
    }
  }
}
