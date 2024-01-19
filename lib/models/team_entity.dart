
class TeamEntity {
  final String name;
  final String coach;
  final String description;
  final String manager;
  final String svgLogo;


  TeamEntity({required this.svgLogo, required this.coach,required this.description,required this.manager, required this.name});

  @override
  String toString() {
    return 'SportEntity{name: $name, coach: $coach, description: $description , manager: $manager, svgLogo: $svgLogo}';
  }

  TeamEntity copyWith({
    String? name,
    String? coach,
    String? description,
    String? manager,
    String? svgLogo,
  }) {
    return TeamEntity(
      name: name ?? this.name,
      coach: coach ?? this.coach,
      description: description ?? this.description,
      manager: manager ?? this.manager,
      svgLogo: svgLogo ?? this.svgLogo,
    );
  }

  factory TeamEntity.fromJson(Map<String, dynamic> json) => TeamEntity(
    name: json["name"] ?? "",
    coach: json["coach"] ?? "",
    description: json["description"] ?? "",
    manager: json["manager"] ?? "",
    svgLogo: json["svgLogo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "coach": coach,
    "description": description,
    "manager": manager,
    "svgLogo": svgLogo,

  };

  factory TeamEntity.defaultVal() => TeamEntity(
    name: "",
    coach: "",
    description: "",
    manager: "",
    svgLogo: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TeamEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
