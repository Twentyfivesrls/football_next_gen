class TrainingEntityDtoForList {
  final String id;
  final String name;
  final String hour;
  final String field;

  TrainingEntityDtoForList({
    required this.id,
    required this.name,
    required this.hour,
    required this.field
  });

  factory TrainingEntityDtoForList.defaultValue() => TrainingEntityDtoForList(
      id: "1",
      name: "name",
      hour: "hour",
      field: "field"
  );
}




class TrainingEntity {
  final String id;
  final String name;
  final String date;
  final String hour;
  final String field;
  final String info;

  TrainingEntity({
    required this.name,
    required this.date,
    required this.hour,
    required this.field,
    required this.info,
    required this.id
  });

  @override
  String toString() {
    return 'TrainingEntity{id: $id,name: $name, date: $date, hour: $hour , field: $field, info: $info}';
  }

  TrainingEntity copyWith({
    String? name,
    String? date,
    String? hour,
    String? field,
    String? info,
    String? id,
  }) {
    return TrainingEntity(
      name: name ?? this.name,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      field: field ?? this.field,
      info: info ?? this.info,
      id: id ?? this.id,
    );
  }

  factory TrainingEntity.fromJson(Map<String, dynamic> json) => TrainingEntity(
    name: json["name"] ?? "",
    date: json["date"] ?? "",
    hour: json["hour"] ?? "",
    field: json["field"] ?? "",
    info: json["info"] ?? "",
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "hour": hour,
    "field": field,
    "info": info,
    "id": id,
  };

  factory TrainingEntity.defaultValue() => TrainingEntity(
    name: "name",
    date: "date",
    hour: "hour",
    field: "field",
    info: "info",
    id: "id",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TrainingEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
