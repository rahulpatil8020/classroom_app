class TeacherDetails{
  String _fname, _mname,_lname, _gender, _registrationId, _uid, _email, _password, _sem, _div, _subject, _branch;
  DateTime _pickeddate;
  TeacherDetails([this._age,this._lname,this._fname,this._gender,this._mname,this._registrationId,this._subject,this._uid,this._email, this._password,this._pickeddate, this._branch,this._div,this._sem]);

  // get pickeddate => _pickeddate;
  //
  // set pickeddate(value) {
  //   _pickeddate = value;
  // }

  DateTime get pickeddate => _pickeddate;

  set pickeddate(DateTime value) {
    _pickeddate = value;
  }


  get sem => _sem;

  set sem(value) {
    _sem = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  String get fname => _fname;

  set fname(String value) {
    _fname = value;
  }

  int _age;

  get mname => _mname;

  set mname(value) {
    _mname = value;
  }

  get lname => _lname;

  set lname(value) {
    _lname = value;
  }

  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get registrationId => _registrationId;

  set registrationId(value) {
    _registrationId = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  get div => _div;

  set div(value) {
    _div = value;
  }

  get subject => _subject;

  set subject(value) {
    _subject = value;
  }

  get branch => _branch;

  set branch(value) {
    _branch = value;
  }
}