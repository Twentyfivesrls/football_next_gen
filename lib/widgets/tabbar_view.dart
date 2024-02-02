import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabbarViewWidget extends StatelessWidget{

  TabController tabController;
  Widget firstTab;
  Widget secondTab;
  Widget thirdTab;

  TabbarViewWidget({
    super.key,
    required this.tabController,
    required this.firstTab,
    required this.secondTab,
    this.thirdTab = const Center()
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: tabController,
        children: <Widget>[
          firstTab,
          secondTab,
          thirdTab
        ],
      );
  }
}