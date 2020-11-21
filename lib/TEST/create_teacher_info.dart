import 'package:classroom/TEST/add_subject_test.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/auth.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/services/sign_in/signin.dart';
import 'package:classroom/services/signup/Subject/dynamicForm.dart';
import 'package:classroom/services/signup/Subject/subjectadd.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestTeacherDetails extends StatefulWidget {
  final TeacherDetails td;
  TestTeacherDetails(this.td);
  @override
  _TestTeacherDetailsState createState() => _TestTeacherDetailsState();
}

class _TestTeacherDetailsState extends State<TestTeacherDetails> {
  final _formKey = GlobalKey<FormState>();
  AuthService authService = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  signup() async {
    await authService.signUpWithEmailAndPassword(
        widget.td.email, widget.td.password);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.td.pickeddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          width: MediaQuery.of(context).size.width - 48,
          child: ListView(
            children: [
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter First Name" : null;
                },
                decoration: InputDecoration(
                  hintText: "First Name",
                ),
                onChanged: (val) {
                  widget.td.fname = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Middle Name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Middle Name",
                ),
                onChanged: (val) {
                  widget.td.mname = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Last Name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Last Name",
                ),
                onChanged: (val) {
                  widget.td.lname = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return "Registration ID is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Registration ID",
                ),
                onChanged: (val) {
                  widget.td.registrationId = val;
                },
                cursorWidth: 10,
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                    "Date of Birth : ${widget.td.pickeddate.day}/${widget.td.pickeddate.month}/${widget.td.pickeddate.year}"),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickDate,
              ),
              TextFormField(
                validator: (val) {
                  return isEmail(val) ? null : "Enter valid Email Address";
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  widget.td.email = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.length < 6 ? "Enter Correct Password" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val) {
                  widget.td.password = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Enter Password";
                  } else if (val.length < 6) {
                    return "Length is less than 6. Password Doesnt Match";
                  } else if (val != widget.td.password) {
                    return "Password Doesnt Match";
                  } else
                    return null;
                },
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    print("Clicked on Sign UP Gradient Button");
                    print(widget.td.fname);
                    print(widget.td.mname);
                    print(widget.td.lname);
                    print(widget.td.registrationId);
                    print(widget.td.pickeddate);
                    print(widget.td.email);
                    print(widget.td.password);
                    signup();

                    Map<String, dynamic> teacherInfo = {
                      "first_name": widget.td.fname,
                      "last_name": widget.td.lname,
                      "middle_name": widget.td.mname,
                      "Registration ID": widget.td.registrationId,
                      "DOB": widget.td.pickeddate,
                      "Email": widget.td.email,
                      "password": widget.td.password,
                      "role": "Teacher",
                    };


                    databaseService
                        .addTeacherData(teacherInfo, widget.td.email)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSubjectTest(td: widget.td,teacherInfo: teacherInfo,)));
                    });
                  }
                  // signUp();
                },
                child: blueButton(context, "Add Subjects"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: widget.td.pickeddate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        widget.td.pickeddate = date;
        print(widget.td.pickeddate);
      });
    }
  }
}
