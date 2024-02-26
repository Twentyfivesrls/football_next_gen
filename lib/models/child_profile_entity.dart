


class ChildProfileEntity {
  final String profileName;
  final String profileDesc;
  final String date;
  final String username;
  final String height;
  final String weight;
  final String favoriteFoot;
  final String role;
  final String career;
  final String favoriteTeam;
  final String favoritePlayer;

  ChildProfileEntity({
    required this.profileName,
    required this.profileDesc,
    required this.date,
    required this.username,
    required this.height,
    required this.weight,
    required this.favoriteFoot,
    required this.favoritePlayer,
    required this.favoriteTeam,
    required this.role,
    required this.career,
  });


  factory ChildProfileEntity.defaultValue() => ChildProfileEntity(
      profileName: "Luigi Rossi",
      profileDesc: "Ciao a tutti! 👋 Sono Luigi, appassionato di calcio e sempre pronto per nuove sfide sul campo! ⚽ Amo il gioco di squadra, la competizione sana e fare nuove amicizie con compagni di squadra e avversari. Il mio obiettivo è migliorare costantemente le mie abilità e fare del mio meglio ogni volta che calco il campo da gioco.",
      height: "140",
      weight: "50",
      career: "3",
      favoriteTeam: "Juventus",
      favoriteFoot: "Destro",
      favoritePlayer: "Cristiano Ronaldo",
      role: "Attaccante",
      date: "01/01/2012",
      username: "mariorossi@mail.it-kid",
  );
}