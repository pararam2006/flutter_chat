class User {
  String userName;
  String email;
  String _password;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  User(this.userName, this.email, this._password);
}