popimport 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/popup_menu_item.dart';
import '../constants/colors.dart';

class PopupMenuWidget extends StatelessWidget{

  List<PopupMenuItem> items;

  PopupMenuWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
     return PopupMenuButton(
       elevation: 5,
       icon: const Icon(Icons.more_vert,color: black25,),
       itemBuilder: (BuildContext context) => <PopupMenuEntry>[
         ...items.map((e) => PopupMenuItem<PopupMenuItemWidget>(
           onTap: e.onTap,
           value: e.value,
           child: e.child,
         )),
       ],
     );
  }

}