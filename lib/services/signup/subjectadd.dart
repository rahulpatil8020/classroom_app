import 'package:classroom/models/teachersignupdetails.dart';
import 'package:flutter/material.dart';

typedef OnDelete();

class AddSubject extends StatefulWidget {
  final TeacherDetails td;
  final OnDelete onDelete;
  AddSubject({this.td, this.onDelete});
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            AppBar()
          ],
        ),

      ),
    );
  }
}
