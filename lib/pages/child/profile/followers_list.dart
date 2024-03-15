import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/profile/profile_list.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/pages/child/profile/widgets/simgle_follower.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/tabbar.dart';
import 'package:football_next_gen/widgets/tabbar_view.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';


class FollowersList extends StatelessWidget {
  const FollowersList({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => ProfileListCubit(),
      child:  const FollowersListWidget(),
    );
  }
}

class FollowersListWidget extends StatefulWidget{
  const FollowersListWidget({super.key});

  @override
  State<StatefulWidget> createState() => FollowersListState();

}

class FollowersListState extends State<FollowersListWidget>  with TickerProviderStateMixin {
  late final TabController tabController;
  int activeIndex = 0;
  ProfileListCubit get _profileCubit => context.read<ProfileListCubit>();


  @override
  void initState() {
    _profileCubit.fetchUserProfileLists();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 3,
        paddingTop: 0,
        paddingLeft: 0,
        paddingRight: 0,
        firstTrailingIconOnTap: (){},
        secondTrailingIconOnTap: (){},
        showFirstTrailingIcon: false,
        goBack: (){
          context.pop();
        },
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TabBarWidget(
                  tabController: tabController,
                  activeIndex: activeIndex,
                  tabs: <Widget>[
                    Tab(
                      child: Text14(
                        text: 'Followers',
                        fontWeight: activeIndex == 0 ? FontWeight.w600 : FontWeight.w500,
                        textColor: activeIndex == 0 ? primary : textProfileGrey,
                      ),
                    ),
                    Tab(
                      child: Text14(
                        text: 'Seguiti',
                        fontWeight: activeIndex == 1 ? FontWeight.w600 : FontWeight.w500,
                        textColor: activeIndex == 1 ? primary : textProfileGrey,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: BlocBuilder<ProfileListCubit, ProfileListPageState>(
                        builder: (_,state) {
                          if(state is ProfileListPageLoading){
                            return const Center(child: CircularProgressIndicator());
                          }
                          else if (state is ProfileListPageLoaded){
                           return TabbarViewWidget(
                                tabController: tabController,
                                firstTab: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ...state.profiles.map((e) =>
                                            SingleFollower(
                                              goToProfile: (){
                                                context.push(AppPage.menuChild.path);
                                              },
                                              profile: e,
                                              textColor: e.removed ? white : primary,
                                              borderColor: e.removed ? primary : secondary,
                                              buttonText: e.removed ? "Segui" : "Rimuovi",
                                              backgroundColor: e.removed ? primary : secondary,
                                              onPressed: () {
                                                setState(() {
                                                  e.removed = !e.removed;
                                                });
                                              },
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                secondTab: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ...state.profiles.map((e) =>
                                            SingleFollower(
                                              goToProfile: (){
                                                context.push(e.isChildProfile ? AppPage.menuChild.path : AppPage.sportsCenterProfile.path);
                                              },
                                              profile: e,
                                              textColor: e.removed ? white : primary,
                                              buttonText: e.removed ? "Segui" : "Rimuovi",
                                              borderColor: e.removed ? primary : secondary,
                                              backgroundColor: e.removed ? primary : secondary,
                                              onPressed: () {
                                                setState(() {
                                                  e.removed = !e.removed;
                                                });
                                              },
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            );
                          }
                          else{
                            // here the state is error
                            return Center(
                              child: Text18(
                                text: (state as ProfileListPageError).error.toString(),
                              ),
                            );
                          }
                        })
                ),

              ],
            ),
          ),
        )
    );
  }

}