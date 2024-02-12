
import 'package:football_next_gen/models/file_entity.dart';

class FileListEntity {
  final DateTime day;
  final List<FileEntity> files;


  FileListEntity({required this.day,required this.files});

  @override
  String toString() {
    return 'FileListEntity{day: $day, files: $files}';
  }

  FileListEntity copyWith({
    DateTime? day,
    List<FileEntity>? files,
  }) {
    return FileListEntity(
      day: day ?? this.day,
      files: files ?? this.files,
    );
  }

  factory FileListEntity.fromJson(Map<String, dynamic> json) => FileListEntity(
    day: json["day"] ?? DateTime.now(),
    files: json["files"] ?? [],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "files": files,

  };

  factory FileListEntity.defaultVal() => FileListEntity(
    day: DateTime.now(),
    files: [],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FileListEntity &&
              runtimeType == other.runtimeType &&
              day == other.day;

  @override
  int get hashCode => day.hashCode;
}
