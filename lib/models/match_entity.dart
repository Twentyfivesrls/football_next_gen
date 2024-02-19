
class MatchEntity {
  final String homeTeam;
  final String awayTeam;
  final String place;
  final String date;
  final String hour;
  final String title;


  MatchEntity({
    required this.homeTeam,
    required this.awayTeam,
    required this.place,
    required this.date,
    required this.hour,
    required this.title,

  });

  @override
  String toString() {
    return 'MatchEntity{homeTeam: $homeTeam, awayTeam: $awayTeam, place: $place, date: $date, hour: $hour, title: $title}';
  }

  MatchEntity copyWith({
    String? homeTeam,
    String? awayTeam,
    String? place,
    String? date,
    String? hour,
    String? title,
  }) {
    return MatchEntity(
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      place: place ?? this.place,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      title: title ?? this.title,
    );
  }

  factory MatchEntity.fromJson(Map<String, dynamic> json) => MatchEntity(
    homeTeam: json["homeTeam"] ?? "",
    awayTeam: json["awayTeam"] ?? "",
    place: json["place"] ?? "",
    date: json["date"] ?? "",
    hour: json["hour"] ?? "",
    title: json["title"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "homeTeam": homeTeam,
    "awayTeam": awayTeam,
    "place": place,
    "date": date,
    "hour": hour,
    "title": title,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MatchEntity &&
              runtimeType == other.runtimeType &&
              homeTeam == other.homeTeam;

  @override
  int get hashCode => homeTeam.hashCode;


  factory MatchEntity.defaultValue() => MatchEntity(
      homeTeam: "homeTeam",
      awayTeam: "awayTeam",
      place: "place",
      date: "date",
      hour: "hour",
      title: 'title',
  );
}

