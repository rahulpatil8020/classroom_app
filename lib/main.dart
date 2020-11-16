import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/sign_in/signin.dart';
import 'package:classroom/services/signup/Subject/dynamicForm.dart';
import 'package:classroom/services/signup/teacherssignup.dart';
import 'package:classroom/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(TeacherDetails()));
}

class MyApp extends StatefulWidget {
  final TeacherDetails td;
  MyApp(this.td);
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
          ? MainScreen(HelperFunction.uSERLOGGEDINKEY)
          // : SignIn(),
      // : TeacherSignUp(widget.td),
      : DynamicForm(),
    );
  }
}
