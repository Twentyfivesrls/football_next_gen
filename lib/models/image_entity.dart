
class ImageEntity {
  final String imageUrl;

  ImageEntity({ required this.imageUrl});

  @override
  String toString() {
    return 'ImageEntity{imageUrl: $imageUrl,}';
  }

  ImageEntity copyWith({
    String? imageUrl,
  }) {
    return ImageEntity(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory ImageEntity.fromJson(Map<String, dynamic> json) => ImageEntity(
    imageUrl: json["imageUrl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
  };

  factory ImageEntity.defaultVal() => ImageEntity(
    imageUrl: "",
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ImageEntity &&
              runtimeType == other.runtimeType &&
              imageUrl == other.imageUrl;

  @override
  int get hashCode => imageUrl.hashCode;
}
