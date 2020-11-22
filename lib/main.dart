import 'package:classroom/TEST/add_subject_test.dart';
import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/student_info.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/sign_in/signin.dart';
import 'package:classroom/services/signup/Subject/dynamicForm.dart';
import 'package:classroom/services/signup/teacherssignup.dart';
import 'package:classroom/views/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(TeacherDetails(), StudentInfo()));
}

class MyApp extends StatefulWidget {
  final TeacherDetails td;
  final StudentInfo si;
  MyApp(this.td, this.si);
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

  checkUserLoggedInStatus() async {
    HelperFunction.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedin ?? false)
          ? MainScreen(widget.si)
          : SignIn(widget.td,widget.si),
          // : AddSubjectTest(widget.td),
      // : TeacherSignUp(widget.td),
      // : MultiForm(td: widget.td,),
    );
  }
}
