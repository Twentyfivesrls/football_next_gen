class AutocompleteEntity {
  final int? id;
  final String value;

  AutocompleteEntity({
     this.id,
    required this.value,
  });

  AutocompleteEntity copyWith({
    int? id,
    String? value,
  }) {
    return AutocompleteEntity(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  factory AutocompleteEntity.fromJson(Map<String, dynamic> json) {
    return AutocompleteEntity(
      id: json['id'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
    };
  }
}
