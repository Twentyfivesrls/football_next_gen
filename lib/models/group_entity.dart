
import 'match_entity.dart';


class GroupEntityDtoForList {
  final String id;
  final String groupName;

  GroupEntityDtoForList({
    required this.id,
    required this.groupName,
  });

  factory GroupEntityDtoForList.defaultValue() => GroupEntityDtoForList(
      id: "1",
      groupName: "groupName"
  );
}


class GroupEntity {
  final String id;
  final String groupName;
  final List<MatchEntity> matches;


  GroupEntity({ required this.matches, required this.groupName, required this.id});

  @override
  String toString() {
    return 'GroupEntity{groups: $matches, groupName:$groupName, id:$id}';
  }

  GroupEntity copyWith({
    List<MatchEntity>? matches,
    String? groupName,
    String? id,

  }) {
    return GroupEntity(
      matches: matches ?? this.matches,
      groupName: groupName ?? this.groupName,
      id: id ?? this.id,
    );
  }

  factory GroupEntity.fromJson(Map<String, dynamic> json) => GroupEntity(
    matches: json["matches"] ?? [],
    groupName: json["groupName"] ?? "",
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "matches": matches,
    "groupName": groupName,
    "id": id,
  };


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupEntity &&
              runtimeType == other.runtimeType &&
              matches == other.matches;

  @override
  int get hashCode => matches.hashCode;


  factory GroupEntity.defaultValue() => GroupEntity(
      matches: [],
      groupName: "groupName",
      id: "id"
  );
}

