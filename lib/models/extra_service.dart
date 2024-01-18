
class ExtraServiceEntity {
  final String name;
  final String svgIcon;


  ExtraServiceEntity({required this.name,required this.svgIcon});

  @override
  String toString() {
    return 'SportEntity{name: $name, svgIcon: $svgIcon}';
  }

  ExtraServiceEntity copyWith({
    String? name,
    String? svgIcon,
  }) {
    return ExtraServiceEntity(
      name: name ?? this.name,
      svgIcon: svgIcon ?? this.svgIcon,
    );
  }

  factory ExtraServiceEntity.fromJson(Map<String, dynamic> json) => ExtraServiceEntity(
    name: json["name"] ?? "",
    svgIcon: json["svgIcon"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "svgIcon": svgIcon,

  };

  factory ExtraServiceEntity.defaultVal() => ExtraServiceEntity(
    name: "",
    svgIcon: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ExtraServiceEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
