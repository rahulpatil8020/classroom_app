import 'package:classroom/models/teachersignupdetails.dart';
import 'package:flutter/material.dart';

class DynamicForm extends StatefulWidget {
  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  List<TeacherDetails> subject = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Subjects"),
        ),
    );
  }
}
