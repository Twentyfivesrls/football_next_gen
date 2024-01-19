import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';
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
    bool showTrailingIcon,
    Function() backOnTap,
    Function() goHome,
    ) {
  return AppBar(
    elevation: 0,
    leading: Visibility(
      visible: showBackIcon,
      child: GestureDetector(
        onTap: backOnTap,
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
    centerTitle: false,
    actions: [
      Visibility(
        visible: showTrailingIcon,
        child: IconButton(
            color: white,
            icon: Icon(trailingIcon),
            onPressed: goHome
        ),
      )
    ],
  );
}

appbarWithoutActions(
    String title,
    BuildContext context,
    IconData trailingIcon,
    bool showSearchInput,
    TextEditingController searchController,
    String hintText,
    Function() goHome,

    ) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: showSearchInput ? InputWidget(
        controller: searchController,
        hintText: hintText
    ) :
    TextH1(
        text: title,
        textColor: white
    ),
    iconTheme: const IconThemeData(color: white),
    backgroundColor: primary,
    actions: [
     IconButton(
            color: white,
            icon: Icon(trailingIcon,color: white,),
            onPressed: goHome
        ),

    ],
  );
}
