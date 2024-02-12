
class FileEntity {
  final String name;
  final String url;


  FileEntity({required this.name,required this.url});

  @override
  String toString() {
    return 'FileEntity{name: $name, url: $url}';
  }

  FileEntity copyWith({
    String? name,
    String? url,
  }) {
    return FileEntity(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory FileEntity.fromJson(Map<String, dynamic> json) => FileEntity(
    name: json["name"] ?? "",
    url: json["url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,

  };

  factory FileEntity.defaultVal() => FileEntity(
    name: "",
    url: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FileEntity &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;
}
