import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/team/create_team_cubit.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/models/confirm_page_data.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/away_team_form.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/home_team_form.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/dropdown_menu.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/language.dart';
import '../../../widgets/dialog.dart';
const List<String> list = <String>['Squadra in casa', 'Squadra in trasferta'];

class AddTeam extends StatelessWidget{

  final bool edit;
  bool isHome;

  AddTeam({super.key, required this.edit, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTeamCubit(),
      child: AddTeamWidget(edit: edit, isHome: isHome) ,
    );
  }
}

class AddTeamWidget extends StatefulWidget{

  final bool edit;
  bool isHome;

  AddTeamWidget({super.key, required this.edit, required this.isHome});

  @override
  State<StatefulWidget> createState() => AddTeamState();

}

class AddTeamState extends State<AddTeamWidget>{

  CreateTeamCubit get _createTeamCubit => context.read<CreateTeamCubit>();
  TextEditingController nameController = TextEditingController();
  TextEditingController coachController = TextEditingController();
  TextEditingController managerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool showHome = true;
  String dropdownValue = list.first;


  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogWidget(
                title: 'Avviso',
                message: widget.edit ? 'Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica della squadra?' : 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione della squadra?',
                confirmText: widget.edit ? 'Elimina modifiche' :'Elimina squadra',
                cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                onConfirm: () {
                  context.go(AppPage.teamsList.path);
                },
              );
            });
      },
      paddingTop: 0,
      appBar: 3,
      showFirstTrailingIcon: false,
      title:  widget.edit ? "Modifica squadra" : AppPage.addTeam.toTitle,
      firstTrailingIconOnTap: (){},
      secondTrailingIconOnTap: (){},
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              widget.edit ? Container() : dropdownSection(),

              Visibility(
                  visible: widget.isHome,
                  child: homeTeamSection(widget.edit)
              ),

              Visibility(
                  visible: !widget.isHome,
                  child: awayTeamSection()
              ),

              buttonsSection()
            ],
          )
      ),
    );
  }

  Widget dropdownSection() {
    return DropdownMenuWidget(
        onSelected: (String? value){
          setState(() {
            dropdownValue = value!;
            if(value == list[0]){
              widget.isHome = true;
            } else {
              widget.isHome = false;
            }
          });
        },
        initialSelection: list.first,
        list: list
    );

  }

  Widget awayTeamSection() {
    return AwayTeamForm(
      nameController: nameController,
      coachController: coachController,
      managerController: managerController,
      descriptionController: descriptionController,
      uploadLogo: () {  },
    );
  }

  Widget homeTeamSection(bool edit) {
    return HomeTeamForm(
      nameController: nameController,
      coachController: coachController,
      managerController: managerController,
      descriptionController: descriptionController,
      uploadLogo: () {  },
      edit: edit,
    );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: DividerWidget(),
        ),

        ActionButton(
          onPressed: (){
            final teamEntity = TeamEntity(svgLogo: "svgLogo", coach: coachController.text,
                description: descriptionController.text,
                manager: managerController.text,
                name: nameController.text,
                isHomeTeam: showHome
            );
            _createTeamCubit.fetchCreatePost(teamEntity);
            context.push(AppPage.confirmPage.path, extra: ConfirmPageData.addTeamConfirmed(context, teamEntity.isHomeTeam!, widget.edit));
          },
          text:  widget.edit ? "Modifica squadra" : getCurrentLanguageValue(ADD_TEAM) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return DialogWidget(
                      title: 'Avviso',
                      message: widget.edit ? 'Procedendo in questo modo, tutti i dati modificati andranno persi. Vuoi davvero annullare la modifica della squadra?' : 'Procedendo in questo modo, tutti i dati inseriti andranno persi. Vuoi davvero annullare la creazione della squadra?',
                      confirmText: widget.edit ? 'Elimina modifiche' :'Elimina squadra',
                      cancelText: getCurrentLanguageValue(CANCEL) ?? "",
                      onConfirm: () {
                        context.go(AppPage.teamsList.path);
                      },
                    );
                  });
            },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        ),

      ],
    );
  }

}