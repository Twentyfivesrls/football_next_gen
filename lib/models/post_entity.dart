import 'package:football_next_gen/constants/images_constants.dart';
import 'package:intl/intl.dart';


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
  final int? id;
  final String image;
  final String description;
  final DateTime date;
  final String likes;
  bool favorite;


  PostEntity({required this.image,required this.description,required this.likes, required this.date,
    this.id, required this.favorite});

  get url => null;


  @override
  String toString() {
    return 'PostEntity{id: $id,image: $image, description: $description, date: $date, favorite: $favorite, likes: $likes}';
  }

  PostEntity copyWith({
    int? id,
    String? image,
    String? description,
    DateTime? date,
    String? likes,
    bool? favorite,
  }) {
    return PostEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      description: description ?? this.description,
      date: date ?? this.date,
      likes: likes ?? this.likes,
      favorite: favorite ?? this.favorite,
    );
  }

  factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
    id: json["id"] ?? 0,
    image: json["image"] ?? "",
    description: json["description"] ?? "",
    date: json["date"] != null ? DateTime.parse(json["date"]) : DateTime.now(),
    favorite: json["favorite"] ?? false,
    likes: json["likes"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "description": description,
    "date": DateFormat('yyyy-MM-ddTHH:mm:ss').format(date),
    "favorite": favorite,
    "likes": likes,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PostEntity &&
              runtimeType == other.runtimeType &&
              image == other.image;

  @override
  int get hashCode => image.hashCode;

  factory PostEntity.defaultValue({bool favorite = true}) => PostEntity(
    id: 1,
    image: ImagesConstants.postImg,
    description: "Il talento in azione! 🚀⚽ Un momento catturato dal campo del Centro Sportivo Olympus, dove il nostro eccezionale calciatore, Marco Rossi, dimostra la sua abilità straordinaria nel calcio. 🌐✨ Un calcio potente, una precisione impeccabile - è davvero il cuore pulsante della nostra squadra! 🏆👟 Marco, grazie per ispirarci con la tua dedizione e passione per il gioco. 🙌💙 Se anche tu vuoi far parte di questa incredibile esperienza calcistica, unisciti a noi al Centro Sportivo Olympus! 🏟️⚡   #Talent #CalcioPassion #CentroSportivoOlympus",
    date: DateTime.now(),
    favorite: favorite,
    likes: "50"
  );

  factory PostEntity.emptyPost() => PostEntity(image: '', description: '', likes: '', date: DateTime.now(), id: 0, favorite: false);

}



