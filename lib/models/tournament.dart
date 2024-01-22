
class TournamentEntity {
  final String name;
  final String typology;
  final String category;
  final String phone;
  final String email;
  final String rules;
  final String info;
  final String poster;


  TournamentEntity({
    required this.typology,
    required this.category,
    required this.phone,
    required this.email,
    required this.rules,
    required this.info,
    required this.poster,
    required this.name
  });

  @override
  String toString() {
    return 'TournamentEntity{'
        'name: $name, '
        'typology: $typology'
        'phone: $phone, '
        'email: $email, '
        'rules: $rules, '
        'info: $info, '
        'poster: $poster, '
        'category: $category}';
  }

  TournamentEntity copyWith({
    String? name,
    String? typology,
    String? phone,
    String? email,
    String? rules,
    String? info,
    String? poster,
    String? category,
  }) {
    return TournamentEntity(
      name: name ?? this.name,
      typology: typology ?? this.typology,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      rules: rules ?? this.rules,
      info: info ?? this.info,
      poster: poster ?? this.poster,
      category: category ?? this.category,
    );
  }

  factory TournamentEntity.fromJson(Map<String, dynamic> json) => TournamentEntity(
    name: json["name"] ?? "",
    typology: json["typology"] ?? "",
    phone: json["phone"] ?? "",
    email: json["email"] ?? "",
    rules: json["rules"] ?? "",
    info: json["info"] ?? "",
    poster: json["poster"] ?? "",
    category: json["category"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "typology": typology,
    "phone": phone,
    "email": email,
    "rules": rules,
    "info": info,
    "poster": poster,
    "category": category,

  };

  factory TournamentEntity.defaultVal() => TournamentEntity(
    name: "",
    typology: "",
    phone: "",
    email: "",
    rules: "",
    info: "",
    poster: "",
    category: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TournamentEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
