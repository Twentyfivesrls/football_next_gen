import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../constants/colors.dart';

whiteAppbar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: white,
    title: TextH1(
      text: title,
      textColor: black25,
    ),
    centerTitle: true,
  );
}

appbarWithActions(
    String title,
    BuildContext context,
    bool showBackIcon,
    IconData trailingIcon,
    bool showSearchInput,
    TextEditingController searchController,
    String hintText,
    ) {
  return AppBar(
    elevation: 0,
    leading: Visibility(
      visible: showBackIcon,
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
        child:const Icon(
          Icons.arrow_back_ios,
          color: white,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: white),
    backgroundColor: primary,
    title: showSearchInput ? InputWidget(
        controller: searchController,
        hintText: hintText
    ) :
    TextH1(
        text: title,
        textColor: white
    ),
    centerTitle: true, actions: [
    IconButton(
        color: white,
        icon: Icon(trailingIcon),
        onPressed: (){}
    )
  ],
  );
}
