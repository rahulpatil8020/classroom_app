import 'package:classroom/helper/constant.dart';
import 'package:classroom/models/student_info.dart';
import 'package:classroom/views/home_page/home.dart';
import 'package:classroom/views/notifications/notifications.dart';
import 'package:classroom/views/profile/profilescreen.dart';
import 'package:classroom/views/study_material/studymaterial.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final StudentInfo si;
  MainScreen(this.si);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  Widget getWidget(index, email) {
    List<Widget> _children = [
      Home(widget.si.email),
      Notifications(),
      StudyMaterial(),
      Profile(widget.si)
    ];
    return _children[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Welcome!"),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(widget.si.email)
            .snapshots(),
        builder: (context, snapshot) {
          print("This");
          widget.si.uid = snapshot.data["UserID"];
          widget.si.lname = snapshot.data["LastName"];
          widget.si.mname = snapshot.data["MiddleName"];
          widget.si.fname = snapshot.data["FirstName"];
          widget.si.div = snapshot.data["Division"];
          widget.si.rollno = snapshot.data["RollNo"];
          widget.si.sem = snapshot.data["Semister"];
          widget.si.branch = snapshot.data["Branch"];
          print(widget.si.uid);
          print(widget.si.lname);
          print(widget.si.mname);
          print(widget.si.fname);
          print(widget.si.div);
          print(widget.si.rollno);
          print(widget.si.sem);
          print(widget.si.branch);

          return getWidget(_currentIndex, widget.si.email);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notifications",
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "StudyMaterial",
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: kPrimaryColor)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     print(widget.si.email);
      //   },
      // ),
    );
  }
}
