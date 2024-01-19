import 'package:flutter/material.dart';

class TabbarViewWidget extends StatelessWidget{

  TabController tabController;
  Widget firstTab;
  Widget secondTab;

  TabbarViewWidget({
    super.key,
    required this.tabController,
    required this.firstTab,
    required this.secondTab
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: tabController,
        children: <Widget>[
          firstTab,
          secondTab
        ],
      );
  }
}