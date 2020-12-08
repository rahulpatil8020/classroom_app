import 'package:flutter/material.dart';

class CreateQuizData{
  String _quizTitle, _quizDescription, _quizId, _quizImageUrl, _deadline;
  DateTime _pickeddate;
  TimeOfDay _time;

  CreateQuizData([this._deadline,this._pickeddate,this._quizDescription,this._quizId,this._quizImageUrl,this._quizTitle,this._time]);


  TimeOfDay get time => _time;

  set time(TimeOfDay value) {
    _time = value;
  }

  DateTime get pickeddate => _pickeddate;

  set pickeddate(DateTime value) {
    _pickeddate = value;
  }

  get deadline => _deadline;

  set deadline(value) {
    _deadline = value;
  }

  String get quizTitle => _quizTitle;

  set quizTitle(String value) {
    _quizTitle = value;
  }


  get quizDescription => _quizDescription;

  set quizDescription(value) {
    _quizDescription = value;
  }

  get quizId => _quizId;

  set quizId(value) {
    _quizId = value;
  }

  String get quizImageUrl => _quizImageUrl;

  set quizImageUrl(String value) {
    _quizImageUrl = value;
  }
}