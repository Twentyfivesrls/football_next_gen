
class TournamentEntityDtoForList {
  final int id;
  final String name;

  TournamentEntityDtoForList({
    required this.id,
    required this.name,
   });

  factory TournamentEntityDtoForList.defaultValue() => TournamentEntityDtoForList(
    id: 0,
    name: "name"
  );
}

class TournamentEntity {
  final int? id;
  final String name;
  final String typology;
  final String category;
  final String phone;
  final String email;
  final String rules;
  final String info;
  final String poster;

  TournamentEntity({
    this.id,
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
    int? id,
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
    id: json["id"] ?? 0,
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
    id: 0,
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

  factory TournamentEntity.emptyPost() => TournamentEntity(typology: '', category: '', phone: '', email: '', rules: '', info: '', poster: '', name: '');

}
