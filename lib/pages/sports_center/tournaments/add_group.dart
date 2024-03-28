import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/group/create_group_cubit.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/add_match_form.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../models/confirm_page_data.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/dialog.dart';

class TextEditingControllerGroup {
  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
}

class AddGroup extends StatelessWidget{
  final int id;
  final bool edit;

  const AddGroup({super.key, required this.id, required this.edit});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateGroupCubit(),
      child:  AddGroupWidget(id: id, edit: edit),
    );
  }
}

class AddGroupWidget extends StatefulWidget {

  final int id;
  final bool edit;

  const AddGroupWidget({super.key, required this.id, required this.edit});

  @override
  State<StatefulWidget> createState() => AddGroupState();
}

class AddGroupState extends State<AddGroupWidget> {

  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  List<TextEditingControllerGroup> matchList = List.empty(growable: true);

  CreateGroupCubit get _createGroupCubit => context.read<CreateGroupCubit>();


  @override
  void initState() {
    matchList.add(TextEditingControllerGroup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      showFirstTrailingIcon: false,
      paddingTop: 0,
      title: widget.edit ? "Modifica girone" : AppPage.addGroup.toTitle,
      appBar: 3,
      firstTrailingIconOnTap: () {},
      secondTrailingIconOnTap: (){},
      goBack: () {
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: widget.edit ? 'Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica del girone?' : 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del girone?',
                confirmText: widget.edit ? 'Elimina modifiche' : 'Elimina girone',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(AppPage.tournamentDetail.path, extra: widget.id);
                },
              );
            });
        },
      body: SingleChildScrollView(
        child: Column(
          children: [

            groupNameSection(),

            ...matchList.map((e) =>
                AddMatchForm(
                    matchTitle: "Partita 1",
                    awayTeamController: awayTeamController,
                    homeTeamController: homeTeamController,
                    placeController: placeController,
                    dateController: dateController,
                    hourController: hourController,
                    cancellable: matchList.indexOf(e) == 0 ? false : true,
                    deleteMatch: (){
                      setState(() {
                        matchList.remove(e);
                      });
                    },
                    addNewTeam: () {
                      context.push(AppPage.addTeam.path);
                    }
                )
            ),
            newMatchButtonSection(),
            buttonsSection()
          ],
        ),
      ),
    );
  }

  Widget groupNameSection(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: InputWidget(
            controller: groupNameController,
            hintText: getCurrentLanguageValue(GROUP_NAME) ?? "",
            labelText: getCurrentLanguageValue(GROUP_NAME) ?? "",
          ),
        ),
        const DividerWidget(),
      ],
    );
  }

  Widget newMatchButtonSection() {
    return
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ActionButton(
          onPressed: () {
            setState(() {
              matchList.add(TextEditingControllerGroup());
            });
          },
          text: getCurrentLanguageValue(ADD_MATCH) ?? "",
          backgroundColor: white,
          borderColor: textProfileGrey,
          rowLayout: false,
          height: 114,
          showPrefixIcon: true,
          textColor: textProfileGrey,
          svgPrefixIcon: ImagesConstants.addCircleImg,
        ),
      );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: ActionButton(
            onPressed: () {
              List<MatchEntity> matches = [
                MatchEntity(homeTeam: homeTeamController.text,
                    awayTeam: awayTeamController.text,
                    place: placeController.text, date: DateTime.now(),
                    title: titleController.text, hour: TimeOfDay.now()),

              ];
              final groupEntity = GroupEntity(
                  matches: matches,
                  groupName: groupNameController.text
              );

              _createGroupCubit.fetchCreateGroup(groupEntity, widget.id);

              context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addGroupConfirmed(context, widget.id, widget.edit, groupEntity.id ?? 0, groupEntity.groupName));
            },
            text: widget.edit ? "Modifica girone" : getCurrentLanguageValue(ADD_GROUP) ?? "",
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return DialogWidget(
                      title: 'Avviso',
                      message: widget.edit ? 'Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica del girone?' : 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione del girone?',
                      confirmText: widget.edit ? 'Elimina modifiche' : 'Elimina girone',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.tournamentDetail.path, extra: widget.id);
                      },
                    );
                  });
              },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,

          ),
        )
      ],
    );
  }
}