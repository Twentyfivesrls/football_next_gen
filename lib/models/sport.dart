
class SportEntity {
  final String name;
  final String svgIcon;


  SportEntity({required this.name,required this.svgIcon});

  @override
  String toString() {
    return 'SportEntity{name: $name, svgIcon: $svgIcon}';
  }

  SportEntity copyWith({
    String? name,
    String? svgIcon,
  }) {
    return SportEntity(
      name: name ?? this.name,
      svgIcon: svgIcon ?? this.svgIcon,
    );
  }

  factory SportEntity.fromJson(Map<String, dynamic> json) => SportEntity(
    name: json["name"] ?? "",
    svgIcon: json["svgIcon"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "svgIcon": svgIcon,

  };

  factory SportEntity.defaultVal() => SportEntity(
    name: "",
    svgIcon: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SportEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
