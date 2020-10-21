import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/auth.dart';
import 'package:classroom/views/main_screen.dart';
import 'package:classroom/views/sign_in/signin.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name;
  AuthService authService = new AuthService();
  bool _isloading = false;

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
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        }
      });
    }
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
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    Spacer(),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter Name" : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter valid Email Address" : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
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
                        return val.length < 6 ? "Enter Correct Password" : null;
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
                              print("Clicked on Sign IN Already have account");
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
                    Spacer()
                  ],
                ),
              ),
            ),
    );
  }
}
