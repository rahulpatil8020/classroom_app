import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> addFieldsData(
      {String branch,
      String semester,
      String studentEmail,
      String div,
      Map studentData}) async {
    await FirebaseFirestore.instance
        .collection("Branch")
        .doc(branch)
        .collection(semester)
        .doc(div)
        .collection("Student Info")
        .doc(studentEmail)
        .set(studentData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> setUserData({Map studentData, String studentEmail}) async {
    await FirebaseFirestore.instance
        .collection("Student Info")
        .doc(studentEmail)
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

  Future<void> addTeacherData(Map questionData, String email) async {
    await FirebaseFirestore.instance
        .collection("Teacher_Info")
        .doc(email)
        .set(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addSubjectData(Map subjectData, String email) async {
    await FirebaseFirestore.instance
        .collection("Teacher_Info")
        .doc(email)
        .collection("Subject_Data")
        .add(subjectData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateSubjectData(Map subjectData, String email, String id) async {
    await FirebaseFirestore.instance
        .collection("Teacher_Info")
        .doc(email)
        .collection("Subject_Data").doc(id)
        .update(subjectData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> deleteSubjectData(String email, String id) async {
    await FirebaseFirestore.instance
        .collection("Teacher_Info")
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
}

getStudentData(String email) async {
  return await FirebaseFirestore.instance
      .collection("Student Info")
      .doc(email)
      .get();
}
