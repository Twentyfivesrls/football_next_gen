import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/profile/extra_services_bloc.dart';
import 'package:football_next_gen/bloc/profile/post_list_bloc.dart';
import 'package:football_next_gen/bloc/profile/profile_bloc.dart';
import 'package:football_next_gen/bloc/profile/sport_fields_bloc.dart';
import 'package:football_next_gen/bloc/profile/sports_bloc.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/models/file_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/info_tab.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/media_tab.dart';
import 'package:football_next_gen/pages/sports_center/profile/tabs/post_tab.dart';
import 'package:football_next_gen/widgets/tabbar.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/profile_header.dart';
import 'package:football_next_gen/widgets/tabbar_view.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_pages.dart';
import '../../../constants/colors.dart';
import '../../../widgets/texts.dart';

class SportsCenterProfile extends StatelessWidget {
  const SportsCenterProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProfileCubit(),
        ),
        BlocProvider(
          create: (_) => SportCubit(),
        ),
        BlocProvider(
          create: (_) => SportFieldsCubit(),
        ),
        BlocProvider(
          create: (_) => ExtraServicesCubit(),
        ),

        BlocProvider(
          create: (_) => PostListCubit(),
        ),
      ],
      child: const SportsCenterProfileWidget(),
    );
  }
}

class SportsCenterProfileWidget extends StatefulWidget {
  const SportsCenterProfileWidget({super.key});
  @override
  State<StatefulWidget> createState() => SportsCenterProfileState();
}

class SportsCenterProfileState extends State<SportsCenterProfileWidget> with TickerProviderStateMixin {

  ProfileCubit get _profileCubit => context.read<ProfileCubit>();
  SportCubit get _sportCubit => context.read<SportCubit>();
  SportFieldsCubit get _sportFieldsCubit => context.read<SportFieldsCubit>();
  ExtraServicesCubit get _extraServicesCubit => context.read<ExtraServicesCubit>();
  PostListCubit get _postCubit => context.read<PostListCubit>();

  var files = [
    FileEntity(url: '',name: 'Comunicazione_avviso.pdf'),
    FileEntity(url: '',name: 'Comunicazione_avviso.pdf'),
    FileEntity(url: '',name: 'Comunicazione_avviso.pdf'),
  ];
  late final TabController tabController;
  int activeIndex = 0;
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeIndex = tabController.index;
      });
    });

    _profileCubit.fetchUserProfile();
    _sportCubit.fetchUserSports();
      _sportFieldsCubit.fetchUserFields();
      _extraServicesCubit.fetchUserServices();
      _postCubit.fetchUserPostLists();


  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ScaffoldWidget(
        goBack: () {context.pop();},
        firstTrailingIconOnTap: () {context.go(AppPage.homeSportsCenter.path);},
        secondTrailingIconOnTap: (){},
        appBar: 2,
        paddingRight: 0,
        paddingLeft: 0,
        paddingTop: 0,
        firstTrailingIcon: Icons.home,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<ProfileCubit,ProfilePageState>(
                builder: (_,state) {
                  if(state is ProfilePageLoading){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if (state is ProfilePageLoaded){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileHeader(
                          isChildProfile: false,
                          goToFollowers: (){},
                          imageProfile: ImagesConstants.sportsCenterProfileImg,
                          profileName: state.profile.profileName,
                          profileDesc: state.profile.profileDesc,
                          editProfile: () {},
                          follower: '0',
                          post: '0',
                          archive: "0"
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

                            Tab(
                              child: Text14(
                                text: 'Archivio',
                                fontWeight: activeIndex == 2 ? FontWeight.w600 : FontWeight.w500,
                                textColor: activeIndex == 2 ? primary : textProfileGrey,
                              ),
                            ),
                          ],
                        ),

                        Expanded(
                            child: TabbarViewWidget(
                                tabController: tabController,
                                firstTab: BlocBuilder<SportCubit,SportPageState>(
                                  builder: (_,sportsState){
                                    if(sportsState is SportPageLoading){
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    else if(sportsState is SportPageLoaded){
                                      return BlocBuilder<SportFieldsCubit,SportFieldsPageState>(
                                          builder: (_,sportsFieldsState){
                                            if(sportsFieldsState is SportFieldsPageLoading){
                                              return const Center(child: CircularProgressIndicator());
                                            }
                                            else if(sportsFieldsState is SportFieldsPageLoaded){
                                              return BlocBuilder<ExtraServicesCubit,ExtraServicesPageState>(
                                                  builder: (_,extraServicesState){
                                                    if(extraServicesState is ExtraServicesPageLoading){
                                                      return const Center(child: CircularProgressIndicator());
                                                    }
                                                    else if(extraServicesState is ExtraServicesPageLoaded){
                                                      return InfoTab(
                                                          address: state.profile.address,
                                                          phone: state.profile.phone,
                                                          email: state.profile.email,
                                                          fields: sportsFieldsState.fields,
                                                          sports: sportsState.sports,
                                                          services: extraServicesState.services
                                                      );
                                                    }
                                                    else{
                                                      // here the state is error
                                                      return Center(
                                                        child: Text18(
                                                          text: (extraServicesState as ExtraServicesPageError).error.toString(),
                                                        ),
                                                      );
                                                    }
                                                  });

                                            }
                                            else{
                                              // here the state is error
                                              return Center(
                                                child: Text18(
                                                  text: (sportsFieldsState as SportFieldsPageError).error.toString(),
                                                ),
                                              );
                                            }
                                          });
                                    }
                                    else{
                                      // here the state is error
                                      return Center(
                                        child: Text18(
                                          text: (sportsState as SportPageError).error.toString(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                secondTab: BlocBuilder<PostListCubit,PostListPageState>(
                                    builder: (_,postState) {
                                      if(postState is PostListPageLoading){
                                        return const Center(child: CircularProgressIndicator());
                                      }
                                      else if(postState is PostListPageLoaded){
                                        return PostTab(
                                            images: postState.posts,
                                            addPost: () {context.push(AppPage.addPost.path,  extra: AppPage.sportsCenterProfile.path);},
                                            goToDetail: (tapped){context.push(AppPage.postDetail.path, extra: {"id":tapped, "path":AppPage.sportsCenterProfile.path});}
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
                                thirdTab: MediaTab(
                                  addFile: (){},
                                  date: date,
                                  files: files,
                                )
                            )
                        ),
                      ],
                    );
                  }
                  else{
                    // here the state is error
                    return Center(
                      child: Text18(
                        text: (state as ProfilePageError).error.toString(),
                      ),
                    );
                  }
                }
            ),
          ),
        )
    );
  }
}
