class AuthenticationEntity{
  String username;
  String password;
  String clientId;
  String clientSecret;
  String grantType;

  AuthenticationEntity({
    required this.username, required this.password, required this.clientId,required this.clientSecret,required this.grantType
  });

  @override
  String toString() {
    return 'UserEntity{username: $username,password: $password,clientId: $clientId,clientSecret: $clientSecret, grandType: $grantType}';
  }

  AuthenticationEntity copyWith({
    String? username,
    String? password,
    String? clientId,
    String? clientSecret,
    String? grantType

  }) {
    return AuthenticationEntity(
        username: username ?? this.username,
        password: password ?? this.password,
        clientId: clientId ?? this.clientId,
        clientSecret: clientSecret ?? this.clientSecret,
        grantType: grantType ?? this.grantType
    );
  }

  factory AuthenticationEntity.fromJson(Map<String, dynamic> json) => AuthenticationEntity(
    username: json["username"] ?? "",
    password: json["password"] ?? "",
    clientId: json["client_id"] ?? "",
    clientSecret: json["client_secret"] ?? "",
    grantType: json["grant_type"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "client_id": clientId,
    "client_secret": clientSecret,
    "grant_type": grantType,
  };

  factory AuthenticationEntity.defaultValue() => AuthenticationEntity(
    username: "username",
    password: "password",
    clientId: "client_id",
    clientSecret: "client_secret",
    grantType: "grant_type",
  );
}