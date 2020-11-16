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
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${widget.td.fname} ${widget.td.lname}"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                  ]),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            print(widget.td.subject);
            print(widget.td.branch);
            print(widget.td.sem);
            print(widget.td.div);
          }
        },
      ),
    );
  }
}
