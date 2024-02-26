import 'package:football_next_gen/constants/images_constants.dart';

class PostEntityDtoForList {
  final String id;
  final String url;

  PostEntityDtoForList({
    required this.id,
    required this.url,
  });

  factory PostEntityDtoForList.defaultValue() => PostEntityDtoForList(
      id: "1d",
      url: ImagesConstants.postImg,
  );
}

class PostEntity {
  final String id;
  final String image;
  final String description;
  final String date;


  PostEntity({required this.image,required this.description, required this.date, required this.id});


  @override
  String toString() {
    return 'PostEntity{id: $id,image: $image, description: $description, date: $date}';
  }

  PostEntity copyWith({
    String? id,
    String? image,
    String? description,
    String? date,
  }) {
    return PostEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    description: json["description"] ?? "",
    date: json["date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "description": description,
    "date": date,

  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PostEntity &&
              runtimeType == other.runtimeType &&
              image == other.image;

  @override
  int get hashCode => image.hashCode;

  factory PostEntity.defaultValue() => PostEntity(
    id: "id",
    image: ImagesConstants.postImg,
    description: "Il talento in azione! 🚀⚽ Un momento catturato dal campo del Centro Sportivo Olympus, dove il nostro eccezionale calciatore, Marco Rossi, dimostra la sua abilità straordinaria nel calcio. 🌐✨ Un calcio potente, una precisione impeccabile - è davvero il cuore pulsante della nostra squadra! 🏆👟 Marco, grazie per ispirarci con la tua dedizione e passione per il gioco. 🙌💙 Se anche tu vuoi far parte di questa incredibile esperienza calcistica, unisciti a noi al Centro Sportivo Olympus! 🏟️⚡   #Talent #CalcioPassion #CentroSportivoOlympus",
    date: "13 agosto 2024",
  );

}



