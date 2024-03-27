import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/group/full_group_bloc.dart';
import 'package:football_next_gen/bloc/match/create_match_cubit.dart';
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

  final int id;
  final int tournamentId;
  final String groupName;

  const GroupDetail({super.key, required this.id, required this.tournamentId, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MatchCubit(),
        ),

        BlocProvider(
          create: (_) => CreateMatchCubit(),
        ),
        BlocProvider(
            create:(_) => FullGroupCubit()
        ),
      ],
      child: GroupDetailWidget(tournamentId: tournamentId, id: id, groupName: groupName,),
    );;
  }
}



class GroupDetailWidget extends StatefulWidget {
  final int id;
  final int tournamentId;
  final String groupName;

  const GroupDetailWidget({super.key, required this.id, required this.tournamentId, required this.groupName});

  @override
  State<StatefulWidget> createState() => GroupDetailState();
}

class GroupDetailState extends State<GroupDetailWidget> {
  TextEditingController homeTeamController = TextEditingController();
  TextEditingController awayTeamController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  MatchCubit get _matchCubit => context.read<MatchCubit>();
  CreateMatchCubit get _createMatchCubit => context.read<CreateMatchCubit>();
  FullGroupCubit get _fullGroupCubit => context.read<FullGroupCubit>();


  @override
  void initState() {
    _matchCubit.fetchMatch();
    _fullGroupCubit.fetchGroup(widget.id);
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
          child: TextH1(text: widget.groupName),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        )
      ],
    );
  }

  Widget newMatchButtonSection() {
    return BlocBuilder<CreateMatchCubit,CreateMatchState>(
        builder: (_,state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ActionButton(
              onPressed: (){
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
        });
  }
}