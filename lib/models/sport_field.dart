
class SportFieldEntity {
  final String name;
  final String svgIcon;
  final String fieldsNumber;


  SportFieldEntity({required this.name,required this.svgIcon, required this.fieldsNumber});

  @override
  String toString() {
    return 'SportEntity{name: $name, svgIcon: $svgIcon, fieldsNumber: $fieldsNumber}';
  }

  SportFieldEntity copyWith({
    String? name,
    String? svgIcon,
    String? fieldsNumber,
  }) {
    return SportFieldEntity(
      name: name ?? this.name,
      svgIcon: svgIcon ?? this.svgIcon,
      fieldsNumber: fieldsNumber ?? this.fieldsNumber,
    );
  }

  factory SportFieldEntity.fromJson(Map<String, dynamic> json) => SportFieldEntity(
    name: json["name"] ?? "",
    svgIcon: json["svgIcon"] ?? "",
    fieldsNumber: json["fieldsNumber"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "svgIcon": svgIcon,
    "fieldsNumber": fieldsNumber,
  };

  factory SportFieldEntity.defaultVal() => SportFieldEntity(
    name: "",
    svgIcon: "",
    fieldsNumber: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SportFieldEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
