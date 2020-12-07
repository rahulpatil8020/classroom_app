import 'package:classroom/views/study_material/studymaterial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Future<void> addUsersData(Map studentData, String studentId) async {
  //   await FirebaseFirestore.instance
  //       .collection("Student Info")
  //       .doc(studentId)
  //       .set(studentData)
  //       .catchError((e) {a
  //     print(e.toString());
  //   });
  // }

  Future<void> addStudentsData({
      String branch,
      String semester,
      String studentEmail,
      String div,
        String id,
      Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Student")
        .doc(id)
        .set(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addResult(Map result, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("Results")
        .add(result)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QuestionsData")
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getQuizData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QuestionsData")
        .get();
  }

  Future<void> addUserData(Map questionData, String email) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(email)
        .set(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addTeacherDataMain(Map questionData, String email, String branch, String semester, String div, String id) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Teacher")
        .doc(id)
        .set(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Future<void> addSubjectDataMain(Map subjectData, String email, String branch, String semester, String div) async {
  //   await FirebaseFirestore.instance
  //       .collection(branch)
  //       .doc(semester)
  //       .collection(div)
  //       .doc("Teacher")
  //       .collection("Subject_Data")
  //       .add(subjectData)
  //       .catchError((e) {
  //     print(e.toString());
  //   });
  // }


  Future<void> addSubjectData(Map subjectData, String email) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(email)
        .collection("Subject_Data")
        .add(subjectData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Future<void> updateSubjectDataMain(
  //     {Map subjectData,
  //     String id,
  //     String branch,
  //     String semester,
  //     String div}) async {
  //   await FirebaseFirestore.instance
  //       .collection(branch)
  //       .doc(semester)
  //       .collection(div)
  //       .doc("Teacher")
  //       .collection("Subject_Data")
  //       .doc(id)
  //       .update(subjectData)
  //       .catchError((e) {
  //         print(branch);
  //         print(id);
  //         print(semester);
  //         print(div);
  //         print(subjectData);
  //
  //     print(e.toString());
  //   });
  // }

  Future<void> updateSubjectData(Map subjectData, String email, String id) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(email)
        .collection("Subject_Data")
        .doc(id)
        .update(subjectData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Future<void> deleteSubjectDataMain(String email, String id,String branch, String semester, String div) async {
  //   await FirebaseFirestore.instance
  //       .collection(branch)
  //       .doc(semester)
  //       .collection(div)
  //       .doc("Teacher")
  //       .collection("Subject_Data").doc(id)
  //       .delete()
  //       .catchError((e) {
  //     print(e.toString());
  //   });
  // }

  Future<void> deleteSubjectData(String email, String id) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(email)
        .collection("Subject_Data").doc(id)
        .delete()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addAssignmentData(
      Map assignmentData, String assignmentId) async {
    await FirebaseFirestore.instance
        .collection("Assignments")
        .doc(assignmentId)
        .set(assignmentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addAssignmentDataInBranch(
      Map assignmentData,
      String assignmentId,
      String branch,
      String semister,
      String division) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semister)
        .doc(division)
        .collection("Assignments")
        .doc(assignmentId)
        .set(assignmentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addAssignQuestion(Map questionData, String assignmentId) async {
    await FirebaseFirestore.instance
        .collection("Assignments")
        .doc(assignmentId)
        .collection("Questions Data")
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addNoticeDataInBranch(Map noticeData, String noticeId,
      String branch, String semister, String division) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semister)
        .doc(division)
        .collection("Notifications")
        .doc(noticeId)
        .set(noticeData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addNoticeData(Map noticeData, String noticeId) async {
    await FirebaseFirestore.instance
        .collection("Notifications")
        .doc(noticeId)
        .set(noticeData)
        .catchError((e) {
      print(e.toString());
    });
  }


  Future<void> addStudentsAttandanceDetailsSubject({
    @required String branch,
    @required String semester,
    @required String div,
    @required String studentId,
    @required String date,
    @required String subject,
    @required String status,
    @required Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Student")
        .doc(studentId)
        .collection(subject).doc("Attendance")
        .collection(status)
        .doc(date)
        .set(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateStudentsAttandanceDetailsSubjectStudents({
    @required String branch,
    @required String semester,
    @required String div,
    @required String studentId,
    @required String date,
    @required String subject,
    @required String status,
    @required Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Student")
        .doc(studentId)
        .collection(subject).doc("Attendance")
        .collection(status)
        .doc(date)
        .update(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }


  Future<void> deleteStudentsAttandanceDetailsSubject({
    @required String branch,
    @required String semester,
    @required String div,
    @required String studentId,
    @required String date,
    @required String subject,
    @required String status,
    @required Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Student")
        .doc(studentId)
        .collection(subject).doc("Attendance")
        .collection(status)
        .doc(date)
        .delete()
        .catchError((e) {
      print(e.toString());
    });
  }


  Future<void> addStudentsAttandanceDetailsSubjectTotal({
    @required String branch,
    @required String semester,
    @required String div,
    @required String studentId,
    @required String subject,
    @required Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Student")
        .doc(studentId)
        .collection("Attendance").doc(subject)
        .set(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }


  Future<void> showStudentsAttandanceDetailsSubject({
    @required String branch,
    @required String semester,
    @required String div,
    @required String teacherId,
    @required String rollno,
    @required String date,
    @required String subject,
    @required Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Teacher")
        .doc(teacherId)
        .collection("Attendance").doc(subject)
        .collection(date)
        .doc(rollno)
        .set(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateStudentsAttandanceDetailsSubject({
    @required String branch,
    @required String semester,
    @required String div,
    @required String teacherId,
    @required String rollno,
    @required String date,
    @required String subject,
    @required Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Teacher")
        .doc(teacherId)
        .collection("Attendance").doc(subject)
        .collection(date)
        .doc(rollno)
        .update(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Future<void> addStudentsAttandanceDetails({
  //   @required String branch,
  //   @required String semester,
  //   @required String div,
  //   @required String studentId,
  //   @required String field,
  //   @required String date,
  //   @required String subject,
  //   @required Map studentData}) async {
  //   await FirebaseFirestore.instance
  //       .collection("Attendance")
  //       .doc(branch)
  //       .collection(semester)
  //       .doc(div)
  //       .collection(subject)
  //       .doc(studentId)
  //       .collection(date)
  //       .doc(field)
  //       .set(studentData)
  //       .catchError((e) {
  //     print(e.toString());
  //   });
  // }




  Future<void> addQuizDetails(Map noticeData, String quizId,
      String branch, String semister, String division) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semister)
        .doc(division)
        .collection("Quiz")
        .doc(quizId)
        .set(noticeData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuizQuestionDetails(Map questionData, String quizId,
      String branch, String semister, String division) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semister)
        .doc(division)
        .collection("Quiz")
        .doc(quizId)
        .collection("QuestionsData")
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateQuizQuestionDetails(
      Map questionData,
      String quizId,
      String branch,
      String semister,
      String division,
      String docId) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semister)
        .doc(division)
        .collection("Quiz")
        .doc(quizId)
        .collection("QuestionsData").doc(docId)
        .update(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }














}

// getStudentData(String email) async {
//   return await FirebaseFirestore.instance
//       .collection("Student Info")
//       .doc(email)
//       .get();
// }
