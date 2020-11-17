import 'package:classroom/models/subjectdetails.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:classroom/services/signup/Subject/subjectadd.dart';
import 'package:classroom/services/signup/teacherssignup.dart';
import 'package:flutter/material.dart';

// class MultiForm extends StatefulWidget {
//   @override
//   _MultiFormState createState() => _MultiFormState();
// }

// class _MultiFormState extends State<MultiForm> {
//   List<UserForm> users = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Subject'),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Save'),
//             textColor: Colors.white,
//             onPressed: onSave,
//           )
//         ],
//       ),
//       body: Container(
//         child: ListView.builder(
//           addAutomaticKeepAlives: true,
//           itemCount: users.length,
//           itemBuilder: (_, i) => users[i],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: onAddForm,
//         foregroundColor: Colors.white,
//       ),
//     );
//   }

//   ///on form user deleted
//   void onDelete(Subject _user) {
//     setState(() {
//       var find = users.firstWhere(
//         (it) => it.td == _user,
//         orElse: () => null,
//       );
//       if (find != null) users.removeAt(users.indexOf(find));
//     });
//   }

//   ///on add form
//   void onAddForm() {
//     setState(() {
//       var _user = Subject();
//       users.add(UserForm(
//         td: _user,
//         onDelete: () => onDelete(_user),
//       ));
//     });
//   }

//   ///on save forms
//   void onSave() {
//     if (users.length > 0) {
//       var allValid = true;
//       users.forEach((form) => allValid = allValid && form.isValid());
//       if (allValid) {
//         var data = users.map((it) => it.td).toList();
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             fullscreenDialog: true,
//             builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: Text('List of Subjects'),
//               ),
//               body: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (_, i) => ListTile(
//                   leading: CircleAvatar(
//                     child: Text(data[i].div.substring(0, 1)),
//                   ),
//                   title: Text(data[i].subject),
//                   subtitle: Text(
//                       "Semister: ${data[i].sem}   Branch: ${data[i].branch}"),
//                 ),
//               ),
//               floatingActionButton: FloatingActionButton(
//                 onPressed: () {
//                   // print(widget.);
//                 },
//               ),
//             ),
//           ),
//         );
//       }
//     }
//   }
// }

class MultiForm extends StatefulWidget {
  final TeacherDetails td;
  MultiForm({this.td});
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject'),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            textColor: Colors.white,
            onPressed: onSave,
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: users.length,
          itemBuilder: (_, i) => users[i],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(TeacherDetails _user) {
    setState(() {
      var find = users.firstWhere(
        (it) => it.td == _user,
        orElse: () => null,
      );
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = TeacherDetails();
      users.add(UserForm(
        td: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms
  void onSave() {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.td).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('List of Subjects'),
              ),
              body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    child: Text(data[i].div.substring(0, 1)),
                  ),
                  title: Text(data[i].subject),
                  subtitle: Text(
                      "Semister: ${data[i].sem}   Branch: ${data[i].branch}"),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  print(widget.td.branch);
                  print(widget.td.subject);
                },
              ),
            ),
          ),
        );
      }
    }
  }
}
