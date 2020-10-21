import 'package:classroom/helper/constant.dart';
import 'package:classroom/views/assignments/assignments.dart';
import 'package:flutter/material.dart';

class StudyMaterial extends StatelessWidget {
  final List subjectNames = [
    "Database Management System",
    "Computer Networks",
    "Software Engineering",
    "Information System",
    "Theory of Computation"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: subjectNames.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: kSecondaryColor,
                      offset: Offset(3, 3),
                      blurRadius: 5.0,
                    )
                  ]),
              child: Text(
                subjectNames[index],
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Assignments()));
          },
        );
      },
    ));
  }
}
