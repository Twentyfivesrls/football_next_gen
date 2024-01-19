
class GroupEntity {
  final String? date;
  final String? place;
  final String? hour;



  GroupEntity({ this.date,  this.place, this.hour});

  @override
  String toString() {
    return 'SportEntity{name: $date, coach: $place, description: $hour}';
  }

  GroupEntity copyWith({
    String? date,
    String? hour,
    String? place,
  }) {
    return GroupEntity(
      date: date ?? this.date,
      hour: hour ?? this.hour,
      place: place ?? this.place,
    );
  }

  factory GroupEntity.fromJson(Map<String, dynamic> json) => GroupEntity(
    date: json["date"] ?? "",
    hour: json["v"] ?? "",
    place: json["place"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "hour": hour,
    "place": place,
  };

  factory GroupEntity.defaultVal() => GroupEntity(
    date: "",
    hour: "",
    place: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupEntity &&
              runtimeType == other.runtimeType &&
              place == other.place;

  @override
  int get hashCode => place.hashCode;
}
