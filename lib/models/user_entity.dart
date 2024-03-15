import 'package:football_next_gen/models/profile_entity.dart';

class UserEntity{
  String username;
  String password;
  String role;
  ProfileEntity profile;


  UserEntity({
    required this.username, required this.password, required this.role, required this.profile
});

  @override
  String toString() {
    return 'UserEntity{username: $username,password: $password, role: $role,  profile: $profile}';
  }

  UserEntity copyWith({
    String? username,
    String? password,
    String? role,
    ProfileEntity? profile,
    String? idKeycloak

  }) {
    return UserEntity(
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
        profile: profile ?? this.profile
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    username: json["username"] ?? "",
    password: json["password"] ?? "",
    role: json["role"] ?? "",
    profile: ProfileEntity.fromJson(json["profile"]) ?? ProfileEntity.defaultValue(),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "role": role,
    "profile": profile.toJson(),
  };

  factory UserEntity.defaultValue() => UserEntity(
    username: "username",
    password: "password",
    role: "role",
    profile: ProfileEntity.defaultValue(),
  );
}