import 'package:classroom/views/assignments/assignments.dart';
import 'package:classroom/views/quiz/Quiz.dart';
import 'package:classroom/widgets/homeScreenBox.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          homeScreenBox(context, "Quiz", Quiz(), size.width, 200, 35),
          homeScreenBox(
              context, "Assignments", Assignments(), size.width, 200, 35)
        ],
      ),
    );
  }
}
