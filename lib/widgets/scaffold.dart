import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'appbars.dart';


class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  // 0 = no appBar, 1 = Appbar without actions, 2 = Appbar with actions
  final int appBar;
  final Widget? bottomNavigationBar;
  final String title;
  final Color backgroundColor;
  final bool hasBackgroundColor;
  final bool showBackIcon;
  final bool showSearchInput;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final IconData trailingIcon;
  TextEditingController? searchController;
  final String hintText;

  ScaffoldWidget({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.title = "",
    this.appBar = 0,
    this.backgroundColor = white,
    this.hasBackgroundColor = false,
    this.paddingBottom = 55,
    this.paddingTop = 55,
    this.paddingRight = 20,
    this.paddingLeft = 20,
    this.showBackIcon = true,
    this.trailingIcon = Icons.settings,
    this.showSearchInput = false,
    this.hintText = "",
    this.searchController,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: appBar >= 2 ? DrawerWidgetV2() : null,
        appBar: appBar == 0 ? null :
        appBar == 1 ? whiteAppbar(context, title) :
        appbarWithActions(
            title,
            context,
            showBackIcon,
            trailingIcon,
            showSearchInput,
            searchController = TextEditingController(),
            hintText,
        ),
        backgroundColor: hasBackgroundColor == true
            ? white
            : backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: EdgeInsets.only(
                top: paddingTop,
                bottom: paddingBottom,
                right: paddingRight,
                left: paddingLeft,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: body,
            )
        )
    );
  }
}