import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/profile/post_home_list.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/pages/child/widgets/post_card.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class HomeChild extends StatelessWidget{
  const HomeChild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostHomeListCubit(),
      child: const HomeChildWidget(),
    );
  }
}

class HomeChildWidget extends StatefulWidget{
  const HomeChildWidget({super.key});
  @override
  State<StatefulWidget> createState() => HomeChildState();
}


class HomeChildState extends State<HomeChildWidget>{

  PostHomeListCubit get _postCubit => context.read<PostHomeListCubit>();
  bool selected = false;

  @override
  void initState() {
    _postCubit.fetchUserPostHomeLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        firstTrailingIconOnTap: (){
          context.push(AppPage.menuChild.path);
        },
        secondTrailingIconOnTap: (){},
        goBack: (){},
        backgroundColor: textProfileGrey,
        paddingTop: 0,
        paddingLeft: 0,
        paddingRight: 0,
        paddingBottom: 0,
        appBar: 3,
        showBackIcon: false,
        firstTrailingIcon: Icons.person,
        body: SingleChildScrollView(
          child: BlocBuilder<PostHomeListCubit,PostHomeListPageState>(
              builder: (_,state) {
                if(state is PostHomeListPageLoading){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(state is  PostHomeListPageLoaded){
                  return Column(
                    children: [
                      ...state.posts.map((e) =>
                          PostCard(
                            post: e,
                            favoriteOnTap: () {
                              setState(() {
                                e.favorite = !e.favorite;
                              });
                            },
                            shareOnTap: (){},
                            favoriteIcon: e.favorite ? Icons.favorite : Icons.favorite_border_outlined,
                            favoriteIconColor: e.favorite ? Colors.red : black25,
                          )
                      ),
                    ],
                  );
                }
                else{
                  // here the state is error
                  return Center(
                    child: Text18(
                      text: (state as  PostHomeListPageError).error.toString(),
                    ),
                  );
                }
              }),
        )
    );
  }
}