import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabbarViewWidget extends StatelessWidget{

  TabController tabController;
  Widget firstTab;
  Widget secondTab;
  Widget? thirdTab;

  TabbarViewWidget({
    super.key,
    required this.tabController,
    required this.firstTab,
    required this.secondTab,
    this.thirdTab
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(firstTab);
    widgetList.add(secondTab);
    if(thirdTab != null){
      widgetList.add(thirdTab!);
    }
    return TabBarView(
        controller: tabController,
        children: widgetList
      );
  }
}