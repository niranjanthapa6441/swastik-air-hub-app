class UserId {
  String _userId;
  UserId(this._userId);
  String get userId => _userId;
  Future<String> setUserId(String userId) async {
    _userId = userId;
    return userId;
  }
}
