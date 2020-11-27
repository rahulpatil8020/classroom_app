class AttendanceModel {
  String _fname, _rollno,_lname, _uid, _date;
  DateTime _currentDate;
  String _status;
  bool _attendance = false;
  int _totalAttendance, _myAttendance , _subjectAttendance, _totalLecture;

  AttendanceModel([
    this._fname,
    this._rollno,
    this._lname,
    this._uid,
    this._date,
    this._currentDate,
    this._status,
    this._attendance,
    this._totalAttendance,
    this._myAttendance,
    this._subjectAttendance,
    this._totalLecture]);

  String get fname => _fname;

  set fname(String value) {
    _fname = value;
  }

  get rollno => _rollno;

  get totalLecture => _totalLecture;

  set totalLecture(value) {
    _totalLecture = value;
  }

  get subjectAttendance => _subjectAttendance;

  set subjectAttendance(value) {
    _subjectAttendance = value;
  }

  get myAttendance => _myAttendance;

  set myAttendance(value) {
    _myAttendance = value;
  }

  int get totalAttendance => _totalAttendance;

  set totalAttendance(int value) {
    _totalAttendance = value;
  }

  bool get attendance => _attendance;

  set attendance(bool value) {
    _attendance = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  DateTime get currentDate => _currentDate;

  set currentDate(DateTime value) {
    _currentDate = value;
  }

  get date => _date;

  set date(value) {
    _date = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  get lname => _lname;

  set lname(value) {
    _lname = value;
  }

  set rollno(value) {
    _rollno = value;
  }
}