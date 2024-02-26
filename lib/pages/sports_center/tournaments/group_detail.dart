import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/match/match_bloc.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/single_match.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../models/match_entity.dart';
import '../../../widgets/buttons.dart';


class GroupDetail extends StatelessWidget{

  final String id;
  final String tournamentId;

  const GroupDetail({super.key, required this.id, required this.tournamentId});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => MatchCubit(),
      child: GroupDetailWidget(tournamentId: tournamentId, id: id,),

    );
  }
}


class GroupDetailWidget extends StatefulWidget {
  final String id;
  final String tournamentId;

  const GroupDetailWidget({super.key, required this.id, required this.tournamentId});

  @override
  State<StatefulWidget> createState() => GroupDetailState();
}

class GroupDetailState extends State<GroupDetailWidget> {


  MatchCubit get _matchCubit => context.read<MatchCubit>();

  final String groupTitle = 'Girone 1';

  @override
  void initState() {
    _matchCubit.fetchMatch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 3,
      paddingRight: 0,
      paddingLeft: 0,
      paddingTop: 0,
      showFirstTrailingIcon: true,
      title: AppPage.groupDetail.toTitle,
      firstTrailingIcon: Icons.home,
      firstTrailingIconOnTap: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      secondTrailingIconOnTap: (){},
      goBack: () {
        context.push(AppPage.tournamentDetail.path, extra: widget.tournamentId);
      },
      body: SingleChildScrollView(
        child: BlocBuilder<MatchCubit,MatchPageState>(
            builder: (_,state) {
              if (state is MatchPageLoading) {
                return const Center(
                    child: CircularProgressIndicator());
              }
              else if (state is MatchPageLoaded) {
                return Column(
                  children: [
                    titleSection(),
                    ...state.matches.map((e) => matchListSection(e)),
                    newMatchButtonSection()
                  ],
                );
              }
              else {
                // here the state is error
                return Center(
                  child: Text18(
                    text: (state as MatchPageError).error.toString(),
                  ),
                );
              }}
        )
      ),
    );
  }

  Widget matchListSection(MatchEntity match) {
    return SingleMatch(
      match: match,
    );
  }

  Widget titleSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: TextH1(text: groupTitle),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        )
      ],
    );
  }

  Widget newMatchButtonSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ActionButton(
        onPressed: (){},
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
}