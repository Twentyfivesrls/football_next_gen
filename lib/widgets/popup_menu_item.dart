import 'package:flutter/material.dart';

class PopupMenuItemWidget extends StatelessWidget{

  final PopupMenuItem item;

  const PopupMenuItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  PopupMenuItem<PopupMenuEntry>(
        onTap: item.onTap,
        value: item.value,
        child: item.child
    );
  }

}