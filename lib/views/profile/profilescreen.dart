import 'package:classroom/helper/constant.dart';
import 'package:classroom/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DatabaseService databaseService = new DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Student Info")
                .snapshots(),
            // .instance
            //     .collection("Branch")
            //     .doc(branch)
            //     .collection(semester)
            //     .doc(div)
            //     .collection("Student Info")
            //     .doc(studentId),
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot course =
                            snapshot.data.documents[index];
                        return ProfileScreen(course["FirstName"], course["Branch"]);
                      });
            }));
  }
}

class ProfileScreen extends StatelessWidget {
  final String name, branch;
  ProfileScreen(this.name, this.branch);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text(name),
        Text(branch)],
        ),
      
    );
  }
}

// class ProfileScreen extends StatelessWidget {
//   final String name;

//   ProfileScreen(this.name);
//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Align(
//       alignment: Alignment.topCenter,
//       child: Column(
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.only(top: 15.0),
//           //   child: Container(
//           //     height: 140,
//           //     width: 140,
//           //     decoration: BoxDecoration(
//           //         shape: BoxShape.circle,
//           //         color: kPrimaryColor,
//           //         border: Border.all(
//           //             color: kSecondaryColor.withOpacity(0.2),
//           //             width: 0.3,
//           //             style: BorderStyle.solid)),
//           //   ),
//           // ),
//           // SizedBox(
//           //   height: size.height * 0.02,
//           // ),
//           Text(
//             name,
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.normal),
//           ),
//           // SizedBox(
//           //   height: size.height * 0.01,
//           // ),
//           // RichText(
//           //     textAlign: TextAlign.center,
//           //     text: TextSpan(
//           //         style: DefaultTextStyle.of(context).style,
//           //         children: <TextSpan>[
//           //           TextSpan(
//           //               text: 'Roll No: ',
//           //               style: TextStyle(
//           //                   fontSize: 20, fontWeight: FontWeight.bold)),
//           //           TextSpan(
//           //               text: '34',
//           //               style: TextStyle(
//           //                   fontSize: 25, fontWeight: FontWeight.bold))
//           //         ])),
//           // SizedBox(
//           //   height: size.height * 0.01,
//           // ),
//           Text(
//             "Computer Engineering (Division A)",
//             style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.normal),
//           ),
//           // SizedBox(
//           //   height: size.height * 0.02,
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           //   child: Container(
//           //     alignment: Alignment.center,
//           //     height: size.height * 0.08,
//           //     decoration: BoxDecoration(
//           //         color: Colors.white,
//           //         borderRadius: BorderRadius.circular(20),
//           //         boxShadow: [
//           //           BoxShadow(
//           //             color: kSecondaryColor.withOpacity(0.02),
//           //             offset: Offset(0, 4),
//           //             blurRadius: 5,
//           //             spreadRadius: 5,
//           //           )
//           //         ]),
//           //     // child: RichText(
//           //     //     textAlign: TextAlign.center,
//           //     //     text: TextSpan(
//           //     //         style: DefaultTextStyle.of(context).style,
//           //     //         children: <TextSpan>[
//           //     //           TextSpan(
//           //     //               text: 'Attendence   ',
//           //     //               style: TextStyle(
//           //     //                   fontSize: 18, fontWeight: FontWeight.bold)),
//           //     //           TextSpan(
//           //     //               text: '75 %',
//           //     //               style: TextStyle(
//           //     //                   fontSize: 20, fontWeight: FontWeight.bold))
//           //     //         ])),
//           //   ),
//           // )
//         ],
//       ),
//     ));
//   }
// }
