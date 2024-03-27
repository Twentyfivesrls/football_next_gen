import 'package:football_next_gen/constants/images_constants.dart';
import 'package:intl/intl.dart';


class ProfileEntityDtoForList {
  final String name;
  final String image;
  final String id;
  bool removed;
  bool isChildProfile;

  ProfileEntityDtoForList({
    required this.name,
    required this.image,
    required this.id,
    required this.removed,
    this.isChildProfile = true,
  });

  factory ProfileEntityDtoForList.defaultValue({bool isChild = true}) => ProfileEntityDtoForList(
    name: "Giovanni Bianchi",
    image: isChild ? ImagesConstants.childImg : ImagesConstants.sportsCenterProfileImg,
    id: "1",
    removed: false,
    isChildProfile: isChild
  );
}

class ProfileEntity {
  final String profileName;
  final String profileDesc;
  final String address;
  final String phone;
  final String email;
  final DateTime? date;
  final String? username;
  final String? height;
  final String? weight;
  final String? role;
  final String? career;
  final String? favoriteTeam;
  final String? favoritePlayer;


  ProfileEntity( {
    required this.profileName,
    this.profileDesc = "",
    required this.address,
    required this.phone,
    required this.email,
    this.date,
    this.username,
    this.height,
    this.weight,
    this.role,
    this.career,
    this.favoriteTeam,
    this.favoritePlayer,
  });


  factory ProfileEntity.defaultValue() => ProfileEntity(
      profileName: "Nome",
      profileDesc: "Descrizione",
      address: "Indirizzo",
      phone: "333-3333333",
      email:  "mail@example.it"
  );

  factory ProfileEntity.fromJson(Map<String,dynamic> json) =>
      ProfileEntity(
          profileName: json["profileName"] ?? "",
          profileDesc: json["profileDesc"] ?? "",
          address: json["address"] ?? "",
          email: json["email"],
          phone: json["phone"] ?? "",
        username: json["username"],
        height: json["height"],
        weight: json["weight"],
        career: json["career"],
        favoritePlayer: json["favoritePlayer"],
        favoriteTeam: json["favoriteTeam"],
        date: json["date"] != null ? DateTime.parse(json["date"]) : DateTime.now(),
      );

  Map<String,dynamic> toJson() =>
      {
        "profileName": profileName,
        "profileDesc": profileDesc,
        "address": address,
        "phone": phone,
        "email": email,
        "date": date != null ? DateFormat('yyyy-MM-dd').format(date!) : null,
        "username": username,
        "height": height,
        "weight": weight,
        "career": career,
        "favoritePlayer": favoritePlayer,
        "favoriteTeam": favoriteTeam
      };
}