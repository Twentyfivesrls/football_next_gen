import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/profile/child_profile_bloc.dart';
import 'package:football_next_gen/bloc/profile/post_list_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/pages/child/profile/widgets/child_info_tab.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/post_tab.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_header.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/tabbar.dart';
import 'package:football_next_gen/widgets/tabbar_view.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';


class ChildProfile extends StatelessWidget {
  const ChildProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChildProfileCubit(),
        ),

        BlocProvider(
          create: (_) => PostListCubit(),
        ),
      ],
      child: const ChildProfileWidget(),
    );
  }
}


class ChildProfileWidget extends StatefulWidget{
  const ChildProfileWidget({super.key});
  @override
  State<StatefulWidget> createState() => ChildProfileState();
}

class ChildProfileState extends State<ChildProfileWidget> with TickerProviderStateMixin {

  ChildProfileCubit get _profileCubit => context.read<ChildProfileCubit>();
  PostListCubit get _postCubit => context.read<PostListCubit>();
  late final TabController tabController;
  int activeIndex = 0;

  @override
  void initState() {
    _profileCubit.fetchChildProfile();
    _postCubit.fetchUserPostLists();
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
        firstTrailingIconOnTap: (){context.go(AppPage.homeChild.path);},
        secondTrailingIconOnTap: (){},
        firstTrailingIcon: Icons.home,
        goBack: (){
          context.go(AppPage.menuChild.path);
        },
        paddingTop: 0,
        paddingRight: 0,
        paddingLeft: 0,
        body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height ,
              child: BlocBuilder<ChildProfileCubit,ChildProfilePageState>(
                  builder: (_,state) {
                    if(state is ChildProfilePageLoading){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if (state is ChildProfilePageLoaded){
                      return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileHeader(
                              imageProfile: ImagesConstants.childImg,
                              profileName: state.profile.profileName,
                              profileDesc: state.profile.profileDesc,
                              followed: state.profile.followed,
                              follower: state.profile.follower,
                              post: state.profile.post,
                              editProfile: (){},
                              goToFollowers: (){
                                context.push(AppPage.followerList.path);
                              },
                            ),

                            TabBarWidget(
                              tabController: tabController,
                              activeIndex: activeIndex,
                              tabs: <Widget>[
                                Tab(
                                  child: Text14(
                                    text: 'Informazioni',
                                    fontWeight: activeIndex == 0 ? FontWeight.w600 : FontWeight.w500,
                                    textColor: activeIndex == 0 ? primary : textProfileGrey,
                                  ),
                                ),
                                Tab(
                                  child: Text14(
                                    text: 'Post',
                                    fontWeight: activeIndex == 1 ? FontWeight.w600 : FontWeight.w500,
                                    textColor: activeIndex == 1 ? primary : textProfileGrey,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabbarViewWidget(
                                  tabController: tabController,
                                  firstTab: ChildInfoTab(
                                    profile: state.profile,
                                  ),
                                  secondTab: BlocBuilder<PostListCubit,PostListPageState>(
                                      builder: (_,postState) {
                                        if(postState is PostListPageLoading){
                                          return const Center(child: CircularProgressIndicator());
                                        }
                                        else if(postState is PostListPageLoaded){
                                          return PostTab(
                                              images: postState.posts,
                                              addPost: () {context.push(AppPage.addPost.path, extra: AppPage.childProfile.path);},
                                              goToDetail: (tapped){context.push(AppPage.postDetail.path, extra: {"id":tapped, "path":AppPage.childProfile.path});}
                                          );
                                        }
                                        else{
                                          // here the state is error
                                          return Center(
                                            child: Text18(
                                              text: (postState as PostListPageError).error.toString(),
                                            ),
                                          );
                                        }}
                                  ),
                              ),
                            )
                          ]
                      );
                    }
                    else{
                      // here the state is error
                      return Center(
                        child: Text18(
                          text: (state as ChildProfilePageError).error.toString(),
                        ),
                      );
                    }
                  }
              ),
            )
        )
    );
  }
}