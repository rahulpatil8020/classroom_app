import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceDisplayModel {
  String name, rollno, date;
  Timestamp currentDate;
  String status, subject;

  AttendanceDisplayModel({
    this.name,
    this.rollno,
    this.date,
    this.currentDate,
    this.status,
  this.subject});
}