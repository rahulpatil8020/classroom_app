import 'package:cloud_firestore/cloud_firestore.dart';

class StudentInfo {
  String _branch, _div, _fname, _mname, _lname, _rollno, _uid, _password, _email, _aboutyou, _role, sem;
  Timestamp _bod;
  DateTime _pickeddate;


  StudentInfo([
      this._branch,
      this._div,
      this._fname,
      this._mname,
      this._lname,
      this._rollno,
      this._uid,
      this._password,
      this._email,
      this._aboutyou,
      this._role,
      this._bod,
      this.sem,
      this._pickeddate]);

  DateTime get pickeddate => _pickeddate;

  set pickeddate(DateTime value) {
    _pickeddate = value;
  }

  get role => _role;

  set role(value) {
    value = "Student";
    _role = value;
  }

  String get branch => _branch;

  set branch(String value) {
    _branch = value;
  }

  get div => _div;

  set div(value) {
    _div = value;
  }

  get fname => _fname;

  set fname(value) {
    _fname = value;
  }

  get mname => _mname;

  set mname(value) {
    _mname = value;
  }

  get lname => _lname;

  set lname(value) {
    _lname = value;
  }

  get rollno => _rollno;

  set rollno(value) {
    _rollno = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get aboutyou => _aboutyou;

  set aboutyou(value) {
    _aboutyou = value;
  }

  Timestamp get bod => _bod;

  set bod(Timestamp value) {
    _bod = value;
  }
}