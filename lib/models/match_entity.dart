import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MatchEntity {
  final String homeTeam;
  final String awayTeam;
  final String place;
  final DateTime date;
  final TimeOfDay hour;
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
    DateTime? date,
    TimeOfDay? hour,
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

  factory MatchEntity.fromJson(Map<String, dynamic> json) {
    // Ottieni la data e l'ora dal JSON
    String dateStr = json["date"] ?? "";
    String timeStr = json["hour"] ?? "";

    // Parse della data nel formato "yyyy-MM-dd"
    DateTime date = dateStr.isNotEmpty ? DateTime.parse(dateStr) : DateTime.now();

    // Parse dell'ora nel formato "HH:mm:ss"
    TimeOfDay timeOfDay = timeStr.isNotEmpty
        ? TimeOfDay.fromDateTime(DateTime.parse("1970-01-01 $timeStr"))
        : TimeOfDay.now();

    return MatchEntity(
      homeTeam: json["homeTeam"] ?? "",
      awayTeam: json["awayTeam"] ?? "",
      place: json["place"] ?? "",
      date: date,
      hour: timeOfDay,
      title: json["title"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "homeTeam": homeTeam,
    "awayTeam": awayTeam,
    "place": place,
    "date": DateFormat('yyyy-MM-dd').format(date),
    "hour": '${hour.hour}:${hour.minute}:00', // Formato "HH:mm:ss"
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
      date: DateTime.now(),
      hour: TimeOfDay.now(),
      title: 'title',
  );

  factory MatchEntity.emptyMatch() => MatchEntity(homeTeam: "homeTeam", awayTeam: "awayTeam", place: "place", date: DateTime.now(), hour: TimeOfDay.now(), title: "title");
}

