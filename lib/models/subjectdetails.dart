class Subject {
  String _sem, _div, _subject, _branch;
  Subject([this._branch,this._div,this._sem,this._subject]);

  get sem => _sem;

  set sem(value) {
    _sem = value;
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
