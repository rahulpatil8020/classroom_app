import 'package:classroom/models/subjectdetails.dart';
import 'package:classroom/models/teachersignupdetails.dart';
import 'package:flutter/material.dart';


// typedef OnDelete();

// class UserForm extends StatefulWidget {
//   final Subject td;
//   final state = _UserFormState();
//   final OnDelete onDelete;

//   UserForm({Key key, this.td, this.onDelete}) : super(key: key);
//   @override
//   _UserFormState createState() => state;

//   bool isValid() => state.validate();
// }

// class _UserFormState extends State<UserForm> {
//   final form = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Material(
//         elevation: 1,
//         clipBehavior: Clip.antiAlias,
//         borderRadius: BorderRadius.circular(8),
//         child: Form(
//           key: form,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               AppBar(
//                       title: Text("Add Subject"),
//                       leading: Icon(Icons.subject),
//                       actions: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: IconButton(
//                             icon: Icon(Icons.delete),
//                             color: Colors.white,
//                             onPressed: () {
//                               print("Tapped on Delete button");
//                               widget.onDelete();
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextFormField(
//                         validator: (val) {
//                           return val.isEmpty ? "Enter Subject" : null;
//                         },
//                         decoration: InputDecoration(
//                           hintText: "Subject",
//                         ),
//                         onChanged: (val) {
//                           widget.td.subject = val;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     DropdownButton<String>(
//                       items: [
//                         DropdownMenuItem(
//                             value: "Computer Engineering",
//                             child: Text("Computer Engineering")),
//                         DropdownMenuItem(value: "E&TC", child: Text("E&TC")),
//                         DropdownMenuItem(
//                             value: "Mechanical Engineering",
//                             child: Text("Mechanical Engineering")),
//                         DropdownMenuItem(
//                             value: "Civil Engineering",
//                             child: Text("Civil Engineering")),
//                         DropdownMenuItem(
//                             value: "Chemical Engineering",
//                             child: Text("Chemical Engineering")),
//                       ],
//                       onChanged: (val) {
//                         setState(() {});
//                         widget.td.branch = val;
//                         print(widget.td.branch);
//                       },
//                       hint: Text("Branch"),
//                       value: widget.td.branch,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 75),
//                       child: Row(
//                         children: [
//                           DropdownButton<String>(
//                             items: [
//                               DropdownMenuItem(
//                                   value: "Sem 1", child: Text("Sem 1")),
//                               DropdownMenuItem(
//                                   value: "Sem 2", child: Text("Sem 2")),
//                               DropdownMenuItem(
//                                   value: "Sem 3", child: Text("Sem 3")),
//                               DropdownMenuItem(
//                                   value: "Sem 4", child: Text("Sem 4")),
//                               DropdownMenuItem(
//                                   value: "Sem 5", child: Text("Sem 5")),
//                               DropdownMenuItem(
//                                   value: "Sem 6", child: Text("Sem 6")),
//                               DropdownMenuItem(
//                                   value: "Sem 7", child: Text("Sem 7")),
//                               DropdownMenuItem(
//                                   value: "Sem 8", child: Text("Sem 8")),
//                             ],
//                             onChanged: (val) {
//                               setState(() {
//                                 widget.td.sem = val;
//                                 print(widget.td.sem);
//                               });
//                             },
//                             hint: Text("Semester"),
//                             value: widget.td.sem,
//                           ),
//                           SizedBox(
//                             width: 40,
//                           ),
//                           DropdownButton<String>(
//                             items: [
//                               DropdownMenuItem(value: "A", child: Text("A")),
//                               DropdownMenuItem(value: "B", child: Text("B")),
//                             ],
//                             onChanged: (val) {
//                               setState(() {
//                                 widget.td.div = val;
//                                 print(widget.td.div);
//                               });
//                             },
//                             hint: Text("Division"),
//                             value: widget.td.div,
//                           ),
//                         ],
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   ///form validator
//   bool validate() {
//     var valid = form.currentState.validate();
//     if (valid) form.currentState.save();
//     return valid;
//   }
// }


typedef OnDelete();

class UserForm extends StatefulWidget {
  final TeacherDetails td;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key key, this.td, this.onDelete}) : super(key: key);
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                      title: Text("Add Subject"),
                      leading: Icon(Icons.subject),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              print("Tapped on Delete button");
                              widget.onDelete();
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "Enter Subject" : null;
                        },
                        decoration: InputDecoration(
                          hintText: "Subject",
                        ),
                        onChanged: (val) {
                          widget.td.subject = val;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<String>(
                      items: [
                        DropdownMenuItem(
                            value: "Computer Engineering",
                            child: Text("Computer Engineering")),
                        DropdownMenuItem(value: "E&TC", child: Text("E&TC")),
                        DropdownMenuItem(
                            value: "Mechanical Engineering",
                            child: Text("Mechanical Engineering")),
                        DropdownMenuItem(
                            value: "Civil Engineering",
                            child: Text("Civil Engineering")),
                        DropdownMenuItem(
                            value: "Chemical Engineering",
                            child: Text("Chemical Engineering")),
                      ],
                      onChanged: (val) {
                        setState(() {});
                        widget.td.branch = val;
                        print(widget.td.branch);
                      },
                      hint: Text("Branch"),
                      value: widget.td.branch,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      child: Row(
                        children: [
                          DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                  value: "Sem 1", child: Text("Sem 1")),
                              DropdownMenuItem(
                                  value: "Sem 2", child: Text("Sem 2")),
                              DropdownMenuItem(
                                  value: "Sem 3", child: Text("Sem 3")),
                              DropdownMenuItem(
                                  value: "Sem 4", child: Text("Sem 4")),
                              DropdownMenuItem(
                                  value: "Sem 5", child: Text("Sem 5")),
                              DropdownMenuItem(
                                  value: "Sem 6", child: Text("Sem 6")),
                              DropdownMenuItem(
                                  value: "Sem 7", child: Text("Sem 7")),
                              DropdownMenuItem(
                                  value: "Sem 8", child: Text("Sem 8")),
                            ],
                            onChanged: (val) {
                              setState(() {
                                widget.td.sem = val;
                                print(widget.td.sem);
                              });
                            },
                            hint: Text("Semester"),
                            value: widget.td.sem,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          DropdownButton<String>(
                            items: [
                              DropdownMenuItem(value: "A", child: Text("A")),
                              DropdownMenuItem(value: "B", child: Text("B")),
                            ],
                            onChanged: (val) {
                              setState(() {
                                widget.td.div = val;
                                print(widget.td.div);
                              });
                            },
                            hint: Text("Division"),
                            value: widget.td.div,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}

