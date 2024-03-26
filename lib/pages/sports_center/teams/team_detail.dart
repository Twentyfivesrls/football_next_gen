import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/bloc/team/full_team_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/widgets/info_box.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class TeamDetail extends StatelessWidget{

  final int id;
  final bool isHome;

  const TeamDetail({super.key, required this.id, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => FullTeamCubit(),
      child: TeamDetailWidget(isHome: isHome, id: id,),

    );
  }
}


class TeamDetailWidget extends StatefulWidget{
  final int id;
  final bool isHome;
  

  const TeamDetailWidget({super.key, required this.id, required this.isHome});
  @override
  State<StatefulWidget> createState() => TeamDetailState();

}

class TeamDetailState extends State<TeamDetailWidget>{

  FullTeamCubit get _teamCubit => context.read<FullTeamCubit>();

  @override
  void initState() {
    _teamCubit.fetchTeam(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        goBack: (){
          context.go(AppPage.teamsList.path);
        },
        firstTrailingIconOnTap: (){
          context.go(AppPage.homeSportsCenter.path);
        },
        secondTrailingIconOnTap: (){},

        paddingTop: 30,
        firstTrailingIcon: Icons.home,
        showBackIcon: true,
        appBar: 3,
        title: AppPage.teamDetail.toTitle,
        body: SingleChildScrollView(
            child: BlocBuilder<FullTeamCubit,FullTeamPageState>(
                builder: (_,state) {
                  if (state is FullTeamPageLoading) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                  else if (state is FullTeamPageLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        editSection(),
                        infoSection(state.team)
                      ],
                    );
                  }
                  else {
                    // here the state is error
                    return Center(
                      child: Text18(
                        text: (state as FullTeamPageError).error.toString(),
                      ),
                    );
                  }}
            )
        )
    );
  }


  Widget editSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text18(
          text: getCurrentLanguageValue(INFO) ??"",
          textColor: primary,
        ),

        GestureDetector(
          onTap: (){
            context.push(AppPage.addTeam.path);
          },
          child: SvgPicture.asset(
              ImagesConstants.editImg
          ),
        )
      ],
    );
  }

  Widget infoSection(TeamEntity team){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14(
            text: getCurrentLanguageValue(LOGO) ?? "",
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SvgPicture.asset(
              ImagesConstants.teamLogoImg,
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InfoBoxWidget(
              labelText: getCurrentLanguageValue(TEAM_NAME) ?? "",
              showIcon: false,
              showBottomText: true,
              text: team.name,
            ),
          ),

          Visibility(
            visible: widget.isHome,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InfoBoxWidget(
                labelText: getCurrentLanguageValue(COACH) ?? "",
                showIcon: false,
                showBottomText: true,
                text: team.coach,
              ),
            ),
          ),

          Visibility(
            visible: widget.isHome,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InfoBoxWidget(
                labelText: getCurrentLanguageValue(MANAGER) ?? "",
                showIcon: false,
                showBottomText: true,
                text: team.manager,
              ),
            ),
          ),

          Visibility(
            visible: widget.isHome,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InfoBoxWidget(
                labelText: getCurrentLanguageValue(DESCRIPTION) ?? "",
                showIcon: false,
                showBottomText: true,
                text: team.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}