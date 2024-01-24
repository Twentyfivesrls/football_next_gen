class TrainingEntity {
  final String name;
  final String date;
  final String hour;
  final String field;
  final String info;

  TrainingEntity(
      {required this.name,
        required this.date,
        required this.hour,
        required this.field,
        required this.info
      });

  @override
  String toString() {
    return 'TrainingEntity{name: $name, date: $date, hour: $hour , field: $field, info: $info}';
  }

  TrainingEntity copyWith({
    String? name,
    String? date,
    String? hour,
    String? field,
    String? info,
  }) {
    return TrainingEntity(
      name: name ?? this.name,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      field: field ?? this.field,
      info: info ?? this.info,
    );
  }

  factory TrainingEntity.fromJson(Map<String, dynamic> json) => TrainingEntity(
    name: json["name"] ?? "",
    date: json["date"] ?? "",
    hour: json["hour"] ?? "",
    field: json["field"] ?? "",
    info: json["info"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "hour": hour,
    "field": field,
    "info": info,
  };

  factory TrainingEntity.defaultVal() => TrainingEntity(
    name: "",
    date: "",
    hour: "",
    field: "",
    info: "",
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
