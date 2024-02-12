


class ProfileEntity {
  final String profileName;
  final String profileDesc;
  final String address;
  final String phone;
  final String email;

  ProfileEntity({
    required this.profileName,
    required this.profileDesc,
    required this.address,
    required this.phone,
    required this.email});


  factory ProfileEntity.defaultValue() => ProfileEntity(
      profileName: "Nome",
      profileDesc: "Descrizione",
      address: "Indirizzo",
      phone: "333-3333333",
      email: "rebeccacarla@annalisa.it");
}