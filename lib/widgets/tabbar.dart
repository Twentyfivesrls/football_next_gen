import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'divider.dart';

class TabBarWidget extends StatelessWidget{
  TabController tabController;
  int activeIndex;
  final List<Widget> tabs;

  TabBarWidget({super.key, required this.tabController, required this.activeIndex, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWidget(),

        TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 5),
          indicatorColor: primary,
          controller: tabController,
          tabs: tabs
        ),
      ],
    );
  }
}