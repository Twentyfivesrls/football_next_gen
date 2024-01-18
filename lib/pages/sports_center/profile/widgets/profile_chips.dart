import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/divider.dart';
import '../../../../widgets/texts.dart';

class ProfileChips extends StatelessWidget{
  TabController tabController;
  int activeIndex;

  ProfileChips({super.key, required this.tabController, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWidget(),

        TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 5),
          indicatorColor: primary,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              child: Text16(
                text: 'Informazioni',
                fontWeight: activeIndex == 0 ? FontWeight.w600: FontWeight.w500,
                textColor: activeIndex == 0 ? primary : textProfileGrey,
              ),
            ),
            Tab(
              child: Text16(
                text: 'Media',
                fontWeight: activeIndex == 1 ? FontWeight.w600: FontWeight.w500,
                textColor: activeIndex == 1 ? primary : textProfileGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}