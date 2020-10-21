import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> addAssignmentData(
      Map assignmentData, String assignmentId) async {
    await FirebaseFirestore.instance
        .collection("Assignments")
        .doc("assignmentId")
        .set(assignmentData)
        .catchError((e) {
      print(e.toString());
    });
  }
}
