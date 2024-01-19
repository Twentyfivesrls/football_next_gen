import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_pages.dart';
import '../../../../constants/language.dart';
import '../../../../models/group_entity.dart';
import '../../../../widgets/texts.dart';
import 'group_card.dart';

class GroupsList extends StatelessWidget{

  final List<GroupEntity> groups;
  const GroupsList({super.key, required this.groups});

  @override

  Widget build(BuildContext context) {
    return  Column(
      children: [
        Visibility(
            visible: groups.isEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text16(
                text: getCurrentLanguageValue(EMPTY_GROUPS_LIST) ?? "",
              ),
            )
        ),
        ...groups.map((e) => groupsList(e,context)),
      ],
    );
  }

  Widget groupsList (GroupEntity group, BuildContext context){
    return GroupCard(
      name: 'Girone 1',
      group: group,
      goToDetail: (){
        GoRouter.of(context).push(AppPage.tournamentDetail.path);
      },
    );
  }
}