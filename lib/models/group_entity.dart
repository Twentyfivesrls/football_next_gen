
import 'match_entity.dart';

class GroupEntity {
  final List<MatchEntity> matches;


  GroupEntity({ required this.matches});

  @override
  String toString() {
    return 'GroupEntity{groups: $matches,}';
  }

  GroupEntity copyWith({
    List<MatchEntity>? matches,
  }) {
    return GroupEntity(
      matches: matches ?? this.matches,
    );
  }

  factory GroupEntity.fromJson(Map<String, dynamic> json) => GroupEntity(
    matches: json["matches"] ?? [],
  );

  Map<String, dynamic> toJson() => {
    "matches": matches,
  };

  factory GroupEntity.defaultVal() => GroupEntity(
    matches: [],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupEntity &&
              runtimeType == other.runtimeType &&
              matches == other.matches;

  @override
  int get hashCode => matches.hashCode;
}
