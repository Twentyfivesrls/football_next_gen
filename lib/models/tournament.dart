
class TournamentEntityDtoForList {
  final String id;
  final String name;

  TournamentEntityDtoForList({
    required this.id,
    required this.name,
   });

  factory TournamentEntityDtoForList.defaultValue() => TournamentEntityDtoForList(
    id: "1",
    name: "name"
  );
}

class TournamentEntity {
  final String id;
  final String name;
  final String typology;
  final String category;
  final String phone;
  final String email;
  final String rules;
  final String info;
  final String poster;

  TournamentEntity({
    required this.id,
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
        'id: $id, '
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
    String? id,
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
      id: id ?? this.id,
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
    id: json["id"] ?? "",
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
    "id": id,
    "name": name,
    "typology": typology,
    "phone": phone,
    "email": email,
    "rules": rules,
    "info": info,
    "poster": poster,
    "category": category,

  };

  factory TournamentEntity.defaultValue() => TournamentEntity(
    id: "id",
    name: "name",
    typology: "typology",
    phone: "phone",
    email: "email",
    rules: "rules",
    info: "info",
    poster: "poster",
    category: "category",
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
