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
    IconData firstTrailingIcon,
    IconData secondTrailingIcon,
    bool showSearchInput,
    TextEditingController searchController,
    String hintText,
    bool showFirstTrailingIcon,
    bool showSecondTrailingIcon,
    Function() backOnTap,
    Function() firstTrailingIconOnTap,
    Function() secondTrailingIconOnTap,
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
    Text18(
        text: title,
        textColor: white
    ),
    centerTitle: false,
    titleSpacing: 0,
    actions: [
      Visibility(
        visible: showFirstTrailingIcon,
        child: IconButton(
            color: white,
            icon: Icon(firstTrailingIcon),
            onPressed: firstTrailingIconOnTap
        ),
      ),
      Visibility(
        visible: showSecondTrailingIcon,
        child: IconButton(
            color: white,
            icon: Icon(secondTrailingIcon),
            onPressed: secondTrailingIconOnTap
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
    bool showTrailingIcon,

    ) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: showSearchInput ? InputWidget(
        controller: searchController,
        hintText: hintText
    ) :
    Text18(
        text: title,
        textColor: white
    ),
    iconTheme: const IconThemeData(color: white),
    backgroundColor: primary,
    actions: [
     Visibility(
       visible: showTrailingIcon,
       child: IconButton(
              color: white,
              icon: Icon(trailingIcon,color: white,),
              onPressed: goHome
          ),
     ),

    ],
  );
}
