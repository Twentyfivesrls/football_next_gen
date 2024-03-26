import 'package:football_next_gen/constants/images_constants.dart';

class TeamEntityDtoForList {
  final int id;
  final String name;
  final bool isHomeTeam;
  final String svgLogo;


  TeamEntityDtoForList({
    required this.id,
    required this.name,
    required this.isHomeTeam,
    required this.svgLogo

  });

  factory TeamEntityDtoForList.defaultValue({bool isHome = true}) => TeamEntityDtoForList(
      id: 0,
      name: "name",
      svgLogo: ImagesConstants.teamLogoImg,
      isHomeTeam: isHome
  );
}

class TeamEntity {
  final int? id;
  final String name;
  final String? coach;
  final String? description;
  final String? manager;
  final String? svgLogo;
  final bool? isHomeTeam;


  TeamEntity({
     this.svgLogo,
     this.id,
     this.coach,
     this.description,
     this.manager,
    required this.name,
    this.isHomeTeam
  });

  @override
  String toString() {
    return 'TeamEntity{id: $id,name: $name, coach: $coach, description: $description , manager: $manager, svgLogo: $svgLogo, isHomeTeam: $isHomeTeam}';
  }

  TeamEntity copyWith({
    int? id,
    String? name,
    String? coach,
    String? description,
    String? manager,
    String? svgLogo,
    bool? isHomeTeam,
  }) {
    return TeamEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      coach: coach ?? this.coach,
      description: description ?? this.description,
      manager: manager ?? this.manager,
      svgLogo: svgLogo ?? this.svgLogo,
      isHomeTeam: isHomeTeam ?? this.isHomeTeam,
    );
  }

  factory TeamEntity.fromJson(Map<String, dynamic> json) => TeamEntity(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    coach: json["coach"] ?? "",
    description: json["description"] ?? "",
    manager: json["manager"] ?? "",
    svgLogo: json["svgLogo"] ?? "",
    isHomeTeam: json["isHomeTeam"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "coach": coach,
    "description": description,
    "manager": manager,
    "svgLogo": svgLogo,
    "isHomeTeam": isHomeTeam,
  };

  factory TeamEntity.defaultValue({required bool isHome}) => TeamEntity(
    id: 1,
    name: "name",
    coach: "coach",
    description: "description",
    manager: "manager",
    svgLogo: "svgLogo",
    isHomeTeam: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TeamEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;

  factory TeamEntity.emptyPost() => TeamEntity(svgLogo: "svgLogo", coach: "coach", description: "description", manager: "manager", name: "name", isHomeTeam: true);
}
