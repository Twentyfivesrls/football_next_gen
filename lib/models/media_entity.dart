import 'package:football_next_gen/constants/images_constants.dart';


class MediaEntity {
  final String url;
  final String date;
  final String name;


  MediaEntity({required this.url, required this.date, required this.name});


  @override
  String toString() {
    return 'MediaEntity{url: $url, date: $date, name: $name}';
  }

  MediaEntity copyWith({
    String? url,
    String? date,
    String? name,
  }) {
    return MediaEntity(
      url: url ?? this.url,
      date: date ?? this.date,
      name: name ?? this.name,
    );
  }

  factory MediaEntity.fromJson(Map<String, dynamic> json) => MediaEntity(
    url: json["url"] ?? "",
    date: json["date"] ?? "",
    name: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "date": date,
    "name": name,

  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MediaEntity &&
              runtimeType == other.runtimeType &&
              url == other.url;

  @override
  int get hashCode => url.hashCode;

  factory MediaEntity.defaultValue() => MediaEntity(
    url: "id",
    date: "20 Febbraio 2024",
    name: "Comunicazione avviso.pdf",
  );

}



