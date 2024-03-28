import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TrainingEntityDtoForList {
  final int id;
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
      id: 1,
      name: "name",
      hour: "hour",
      field: "field",
  );
}

enum DaysOfWeek {
  Lunedi,
  Martedi,
  Mercoledi,
  Giovedi,
  Venerdi,
  Sabato,
  Domenica
}


class TrainingEntity {
  final int? id;
  final String name;
  final DateTime date;
  final TimeOfDay hour;
  final String field;
  final String info;
  final int weeksToRepeat;
  final Set<DaysOfWeek> daysOfWeek;
  final DateTime dateEnd;


  TrainingEntity( {
    required this.name,
    required this.date,
    required this.hour,
    required this.field,
    required this.info,
     this.id,
    required this.weeksToRepeat,
    required this.daysOfWeek,
    required this.dateEnd

  });

  @override
  String toString() {
    return 'TrainingEntity{id: $id,name: $name, date: $date, hour: $hour , field: $field, info: $info, weeksToRepeat: $weeksToRepeat, daysOfWeek: ${daysOfWeek.toString()}, dateEnd: $dateEnd}';
  }

  TrainingEntity copyWith({
    String? name,
    DateTime? date,
    TimeOfDay? hour,
    String? field,
    String? info,
    int? id,
    int? weeksToRepeat,
    Set<DaysOfWeek>? daysOfWeek,
    DateTime? dateEnd

  }) {
    return TrainingEntity(
      name: name ?? this.name,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      field: field ?? this.field,
      info: info ?? this.info,
      id: id ?? this.id,
      weeksToRepeat: weeksToRepeat ?? this.weeksToRepeat,
        daysOfWeek: daysOfWeek ?? this.daysOfWeek, // Mantieni lo stesso insieme di giorni della settimana se non specificato
      dateEnd: dateEnd ?? this.dateEnd
    );
  }


  // Metodo privato per la conversione della stringa del giorno della settimana in enum DayOfWeek
  static DaysOfWeek _parseDaysOfWeek(String daysOfWeekString) {
    switch (daysOfWeekString) {
      case 'Lunedi':
        return DaysOfWeek.Lunedi;
      case 'Martedi':
        return DaysOfWeek.Martedi;
      case 'Mercoledi':
        return DaysOfWeek.Mercoledi;
      case 'Giovedi':
        return DaysOfWeek.Giovedi;
      case 'Venerdi':
        return DaysOfWeek.Venerdi;
      case 'Sabato':
        return DaysOfWeek.Sabato;
      case 'Domenica':
        return DaysOfWeek.Domenica;
      default:
        throw ArgumentError('Invalid day of week: $daysOfWeekString');
    }
  }


  factory TrainingEntity.fromJson(Map<String, dynamic> json) {
    String name = json["name"] ?? "";
    DateTime dateEnd = json["dateEnd"] != null ? DateTime.parse(json["dateEnd"]) : DateTime.now();
    String dateStr = json["date"] ?? "";
    String timeStr = json["hour"] ?? "";
    DateTime date = dateStr.isNotEmpty ? DateTime.parse(dateStr) : DateTime.now();
    TimeOfDay timeOfDay = timeStr.isNotEmpty
        ? TimeOfDay.fromDateTime(DateTime.parse("1970-01-01 $timeStr"))
        : TimeOfDay.now();
    String field = json["field"] ?? "";
    String info = json["info"] ?? "";
    int id = json["id"] ?? 0;
    int weeksToRepeat = json["weeksToRepeat"] ?? 0;

    Set<DaysOfWeek> daysOfWeek = {};
    if (json.containsKey('daysOfWeek') && json['daysOfWeek'] != null) {
      List<String> daysOfWeekStrings = List<String>.from(json['daysOfWeek']);
      daysOfWeek = daysOfWeekStrings.map((day) => _parseDaysOfWeek(day)).toSet();
    }

    return TrainingEntity(
      name: name,
      date: date,
      hour: timeOfDay,
      field: field,
      info: info,
      id: id,
      weeksToRepeat: weeksToRepeat,
      daysOfWeek: daysOfWeek,
      dateEnd: dateEnd,
    );
  }


  Map<String, dynamic> toJson() {
    // Converti l'insieme di enum DayOfWeek in una lista di stringhe
    List<String> daysOfWeekStrings = daysOfWeek.map((day) => day.toString().split('.').last).toList();

    return {
      "name": name,
      "date": DateFormat('yyyy-MM-ddTHH:mm:ss').format(date),
      "dateEnd": DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateEnd),
      "hour": "${hour.hour.toString().padLeft(2,'0')}:${hour.minute.toString().padLeft(2,'0')}", // Formato "HH:mm:ss"
      "field": field,
      "info": info,
      "id": id,
      "weeksToRepeat": weeksToRepeat,
      "daysOfWeek": daysOfWeekStrings, // Serializza la lista di stringhe dei giorni della settimana
    };
  }


  factory TrainingEntity.defaultValue({DateTime? date}) => TrainingEntity(
    name: "name",
    date: date ?? DateTime.now(),
    hour: TimeOfDay.now(),
    field: "field",
    info: "info",
    id: 0,
    weeksToRepeat: 0,
    daysOfWeek: {},
    dateEnd: date ?? DateTime.now(),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TrainingEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;

  factory TrainingEntity.emptyTraining() => TrainingEntity(name: "name", date: DateTime.now(), hour: TimeOfDay.now(), field: "field", info: "info", weeksToRepeat: 0,   daysOfWeek: {},
    dateEnd: DateTime.now()
  );

  }
