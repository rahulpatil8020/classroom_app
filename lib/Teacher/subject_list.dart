import 'package:classroom/TEST/add_subject_test.dart';
import 'package:classroom/models/statechecker.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/widgets/appBar.dart';
import 'package:classroom/widgets/dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SubjectList extends StatefulWidget {
  final String title;
  final TeacherDetails td;
  final Widget _widget;
  final IsCompleted ic;
  SubjectList(this.td, this.title, this._widget, this.ic);
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  // var;
  String now;
  String no = randomNumeric(1);
  List<Color> getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return [Color(0xffffafbd),Color(0xffffc3a0)];
        break;
      case 2:
        return [Color(0xff2193b0),Color(0xff6dd5ed)];
        break;
      case 3:
        return [Color(0xffcc2b5e),Color(0xff753a88)];
        break;
      case 4:
        return [Color(0xff4568dc),Color(0xffb06ab3)];
        break;
      case 5:
        return [Color(0xffde6262),Color(0xffffb88c)];
        break;
      case 6:
        return [Color(0xff06beb6),Color(0xff48b1bf)];
        break;
      case 7:
        return [Color(0xffeb3349),Color(0xfff45c43)];
        break;
      case 8:
        return [Color(0xffdd5e89),Color(0xfff7bb97)];
        break;
      case 9:
        return [Color(0xffeecda3),Color(0xffef629f)];
        break;
      case 0:
        return [Color(0xff02aab0),Color(0xff00cdac)];
        break;
      default:
        return [Color(0xff43cea2),Color(0xff185a9d)];
    }
  }

  Color getcolor(int priority) {
    switch (priority) {
      case 1:
        return Colors.pink;
        break;
      case 6:
        return Colors.pink;
        break;
      case 0:
        return Colors.black;
        break;
      default:
        return Colors.white;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "${widget.title}"),
      // AppBar(
      //   title: Text(widget.title),
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(widget.td.email)
            .collection("Subject_Data")
            .snapshots(),
        builder: (context, snapshot) {
          return Container(
            color: Colors.black,
            child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data.documents[index];
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                } else {
                  return GestureDetector(
                    onTap: () async {
                      // if(widget.ic.isCompleted == false) {
                      widget.td.branch = course["Branch"];
                      widget.td.div = course["Division"];
                      widget.td.subject = course["Subject"];
                      widget.td.sem = course["Semester"];
                      now = course["rn"];
                      print(widget.td.subject);
                      print(widget.td.branch);
                      print(widget.td.sem);
                      print(widget.td.div);
                      print(widget.td.uid);
                      print(now);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget._widget));
                      // }
                      // else {
                      //   final action = await Dialogs.yesAbortDialog(context, "WARNING", "Do you want to save and proceed further?");
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: getPriorityColor(
                                int.parse(course["rn"])
                            ),
                          )
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            // child: Text(widget.td.div.substring(0, 1)),
                            child: Text(course["Division"], style: TextStyle(fontSize: 18),),
                            backgroundColor: Colors.black,
                          ),
                          // title: Text(widget.td.subject),  Lonar lake assam bhutan eggs bene sherlock
                          title: Text(course["Subject"], style: TextStyle(color: getcolor(
                              int.parse(course["rn"]),
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),),
                          subtitle: Text(
                              "Semister: ${course["Semester"]}   Branch: ${course["Branch"]}", style: TextStyle(color: getcolor(
                              int.parse(course["rn"])
                          ),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(no);
        },
      ),
    );
  }
}
