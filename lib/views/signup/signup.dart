import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/auth.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/views/main_screen.dart';
import 'package:classroom/views/sign_in/signin.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../../widgets/appBar.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email,
      password,
      fname,
      mname,
      lname,
      userId,
      div,
      semister,
      branch,
      aboutyou,
      branchId,
      semisterId,
      divID,
      rollno;

  DateTime pickeddate;
  AuthService authService = new AuthService();
  bool _isloading = false;
  DatabaseService databaseService = new DatabaseService();
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
          .signUpWithEmailAndPassword(email, password)
          .then((value) {
        if (value != null) {
          setState(() {
            _isloading = false;
          });
          HelperFunction.saveUserLoggedInDetails(isloggedin: true);
        }
      });

      userId = randomAlphaNumeric(20);
      branchId = randomAlphaNumeric(5);
      semisterId = randomAlphaNumeric(5);
      divID = randomAlphaNumeric(3);
      Map<String, String> userMap = {
        "FirstName": fname,
        "MiddleName": mname,
        "LastName": lname,
        "Email": email,
        "RollNo": rollno,
        "password": password,
        "Dataofbirth": pickeddate.toString(),
        "Branch": branch,
        "Semister": semister,
        "UserID": userId,
      };
      databaseService
          .addFieldsData(
              branch: branch,
              div: div,
              semester: semister,
              studentId: userId,
              studentData: userMap)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickeddate = DateTime.now();
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
                            fname = val;
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
                            mname = val;
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
                            lname = val;
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
                                return val.length <= 5 && val.isNotEmpty
                                    ? null
                                    : "Roll number should be of 2 digits";
                              },
                              decoration: InputDecoration(
                                hintText: "Roll No.(5 digit)",
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                rollno = val;
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
                                div = val;
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
                              "Date of Birth : ${pickeddate.day}/${pickeddate.month}/${pickeddate.year}"),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: _pickDate,
                        ),
                        Row(
                          children: [
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
                                branch = val;
                                print(branch);
                              },
                              hint: Text("Branch"),
                              value: branch,
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
                                  semister = val;
                                  print(semister);
                                });
                              },
                              hint: Text("Semester"),
                              value: semister,
                            ),
                          ],
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
                            email = val;
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
                            password = val;
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
                                          builder: (context) => SignIn()));
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
                                          builder: (context) => SignIn()));
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
        initialDate: pickeddate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime.now());

    if (date != null) {
      setState(() {
        pickeddate = date;
        print(pickeddate);
      });
    }
  }
}
