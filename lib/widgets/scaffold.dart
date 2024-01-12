import 'package:flutter/material.dart';
import '../constants/colors.dart';


class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  // 0 = no appBar, 1 = Appbar without actions, 2 = Appbar with actions
  final int appBar;
  final Widget? bottomNavigationBar;
  final String title;
  final Color backgroundColor;
  final bool hasBackgroundColor;

  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.title = "",
    this.appBar = 0,
    this.backgroundColor = white,
    this.hasBackgroundColor = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: appBar >= 2 ? DrawerWidgetV2() : null,
     //   appBar: appBar == 0 ? null : appBar == 1 ? appbarSenzaActionsV2(context, title) : appbarConActionsV2(title, context),

        backgroundColor: hasBackgroundColor == true
            ? white
            : backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: body,
        )
    );
  }
}