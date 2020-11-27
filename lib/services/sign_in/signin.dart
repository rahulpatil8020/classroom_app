import 'package:classroom/TEST/create_teacher_info.dart';
import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/student_info.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/auth.dart';
import 'package:classroom/services/database.dart';
import 'package:classroom/services/signup/signup.dart';
import 'package:classroom/views/main_screen.dart';
import 'package:classroom/views/teacher_main_screen/teacher_main_screen.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final TeacherDetails td;
  final StudentInfo si;
  SignIn(this.td, this.si);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email = "test@test.com", password = "123456", id;
  AuthService authService = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  bool _isLoading = false;

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await authService.signInEmailAndPass(email, password).then((value) {
        // await authService.signInEmailAndPass("test@test.com", "123456").then((value) {
          id = value.uid;
          if (value != null) {
            setState(() {
              _isLoading = false;
            });
            HelperFunction.saveUserLoggedInDetails(isloggedin: true);
            print(widget.td.email);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RouteDecide(td: widget.td,email: email,password: password,si: widget.si,id : id)));
            // MainScreen
          }
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                height: size.height * 0.9,
                width: size.width,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            return isEmail(val)
                                ? null
                                : "Enter Valid Email Address";
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                          initialValue: email,
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
                            return val.isEmpty && val.length > 6
                                ? "Enter Password"
                                : null;
                          },
                          initialValue: password,
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
                            signIn();
                            print("Clicked on Sign IN Linear Gradient");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              // gradient: LinearGradient(
                              // colors: [
                              //   Color.fromRGBO(66, 133, 244, 1),
                              //   Color.fromRGBO(219, 68, 55, 1),
                              //   Color.fromRGBO(244, 180, 0, 1),
                              //   Color.fromRGBO(15, 157, 88, 1),
                              // ],
                              //       begin: Alignment.centerLeft,
                              //         end: Alignment.centerRight,
                              //         ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: size.height * 0.08,
                            alignment: Alignment.center,
                            width: size.width * 0.8,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
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
                                            SignUp(widget.td,widget.si)));
                                print("Clicked on don't have an Account");
                              },
                              child: Text(
                                "Dont have an Account?",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUp(widget.td, widget.si)));
                                print("Clicked on Sign Up");
                              },
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TestTeacherDetails(widget.td),
                                ));
                            print("Clicked on Sign IN Linear Gradient");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              //: LinearGradient(
                              // colors: [
                              //      Color.fromRGBO(66, 133, 244, 1),
                              //     Color.fromRGBO(219, 68, 55, 1),
                              //    Color.fromRGBO(244, 180, 0, 1),
                              //   Color.fromRGBO(15, 157, 88, 1),
                              // ],
                              //   begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight,
                              //),
                              borderRadius: BorderRadius.circular(30),
                              color: kPrimaryColor,
                            ),
                            height: size.height * 0.08,
                            alignment: Alignment.center,
                            width: size.width * 0.8,
                            child: Text(
                              "Teacher Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //  height: 100,
                        //)
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}




class RouteDecide extends StatelessWidget {
  final TeacherDetails td;
  final StudentInfo si;
  final String email,id;
  final String password;
  String role;
  RouteDecide({this.td,this.si,this.password,this.email, this.id});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("User")
          .doc(email)
          .snapshots(),
      builder: (context,snapshot){
        role = snapshot.data["role"];
        if(role == "Student"){
          si.uid = id;
          si.email = email;
          si.password = password;
          return  MainScreen(si);
        }
        else{
          td.uid = id;
          td.email = email;
          td.password = password;
          return TeacherMainScreen(td);
        }

        // } else return Center(
        //   child: Container(
        //     child: Text("Some Error"),
        //   ),
        // );
      },
    );
  }
}

