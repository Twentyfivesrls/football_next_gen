import 'package:flutter/cupertino.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';

class AuthListener with ChangeNotifier{
  static final AuthListener _authentication = AuthListener._internal();

  factory AuthListener() {
    return _authentication;
  }
  AuthListener._internal();

  String? _token;
  UserEntity? _profile;

  String? get token => _token;
  UserEntity? get profile => _profile;

  void setAuthenticationData(UserEntity? profile, String? token) {
    _token = token;
    _profile = profile;
    notifyListeners();
  }

  void clearAuthenticationData() {
    _token = null;
    _profile = null;
    notifyListeners();
  }

  void initAuthenticationData() async {
    // TODO
    // here we will check if the token is present at app startup, so we can
    // login automatically
    notifyListeners();
  }

}