import 'package:flutter/material.dart';

class PopupMenuItemEntity {
  final Function onTap;
  final String value;
  final Widget child;


  PopupMenuItemEntity({required this.onTap,required this.value, required this.child});

  @override
  String toString() {
    return 'PopupMenuItemEntity{onTap: $onTap, value: $value, child: $child}';
  }

  PopupMenuItemEntity copyWith({
    Function? onTap,
    String? value,
    Widget? child,
  }) {
    return PopupMenuItemEntity(
      onTap: onTap ?? this.onTap,
      value: value ?? this.value,
      child: child ?? this.child,
    );
  }

  factory PopupMenuItemEntity.fromJson(Map<String, dynamic> json) => PopupMenuItemEntity(
    onTap: json["onTap"] ?? emptyFunction,
    value: json["value"] ?? "",
    child: json["child"] ?? const Center(),
  );

  Map<String, dynamic> toJson() => {
    "onTap": onTap,
    "value": value,
    "child": child,

  };

  factory PopupMenuItemEntity.defaultVal() => PopupMenuItemEntity(
    onTap: emptyFunction,
    value: "",
    child: const Center(),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PopupMenuItem &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}
emptyFunction(){}