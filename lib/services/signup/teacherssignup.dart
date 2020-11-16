import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/sign_in/signin.dart';
import 'package:classroom/services/signup/Subject/subjectadd.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TeacherSignUp extends StatefulWidget {
  final TeacherDetails td;
  TeacherSignUp(this.td);
  @override
  _TeacherSignUpState createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  final _formKey = GlobalKey<FormState>();
  DateTime pickeddate;
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickeddate = DateTime.now();
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
                  if(val.isEmpty){
                    return "Registration ID is empty";
                  } return null;
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
                    "Date of Birth : ${pickeddate.day}/${pickeddate.month}/${pickeddate.year}"),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickDate,
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
                  widget.td.email = val;
                },
              ),
              SizedBox(
                height: 10,
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
                  widget.td.password = val;
                },
              ),
              SizedBox(
                height: 40,
              ),

              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if(_formKey.currentState.validate()){
                    print("Clicked on Sign UP Gradient Button");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddSubject(td: widget.td,)));
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
