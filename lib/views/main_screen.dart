import 'package:classroom/helper/constant.dart';
import 'package:classroom/views/home_page/home.dart';
import 'package:classroom/views/notifications/notifications.dart';
import 'package:classroom/views/profile/profilescreen.dart';
import 'package:classroom/views/study_material/studymaterial.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String email;
  MainScreen(this.email);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  Widget getWidget(index, email) {
    List<Widget> _children = [
      Home(email),
      Notifications(),
      StudyMaterial(),
      Profile(email)
    ];
    return _children[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: getWidget(_currentIndex, widget.email),
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
            }));
  }
}
