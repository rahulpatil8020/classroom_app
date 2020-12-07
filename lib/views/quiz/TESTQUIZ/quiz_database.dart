import 'package:cloud_firestore/cloud_firestore.dart';

class QuizDatabase {
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
}