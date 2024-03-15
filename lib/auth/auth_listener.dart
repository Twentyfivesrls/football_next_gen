import 'package:flutter/cupertino.dart';
import 'package:football_next_gen/models/profile_entity.dart';

class AuthListener with ChangeNotifier{
  static final AuthListener _authentication = AuthListener._internal();

  factory AuthListener() {
    return _authentication;
  }
  AuthListener._internal();

  String? _token;
  ProfileEntity? _profile;

  String? get token => _token;
  ProfileEntity? get profile => _profile;

  void setAuthenticationData(ProfileEntity? profile, String? token) {

  }

  void clearAuthenticationData() {

  }

  void initAuthenticationData() async {

  }

}