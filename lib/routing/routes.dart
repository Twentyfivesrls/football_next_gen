import 'package:football_next_gen/auth/auth_listener.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/models/confirm_page_data.dart';
import 'package:football_next_gen/pages/child/home_child.dart';
import 'package:football_next_gen/pages/child/menu_child.dart';
import 'package:football_next_gen/pages/child/profile/child_profile.dart';
import 'package:football_next_gen/pages/child/profile/followers_list.dart';
import 'package:football_next_gen/pages/login_section/login/login.dart';
import 'package:football_next_gen/pages/login_section/recover_password/recover_password.dart';
import 'package:football_next_gen/pages/login_section/register/insert_otp.dart';
import 'package:football_next_gen/pages/settings/reset_password.dart';
import 'package:football_next_gen/pages/sports_center/home_sports_center.dart';
import 'package:football_next_gen/pages/sports_center/profile/edit_profile.dart';
import 'package:football_next_gen/pages/sports_center/profile/post/add_post.dart';
import 'package:football_next_gen/pages/sports_center/profile/post/post_detail.dart';
import 'package:football_next_gen/pages/sports_center/profile/sports_center_profile.dart';
import 'package:football_next_gen/pages/settings/settings.dart';
import 'package:football_next_gen/pages/sports_center/teams/add_team.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/add_group.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/add_tournament.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/group_detail.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/tournament_detail.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/tournaments_list.dart';
import 'package:football_next_gen/pages/sports_center/trainings/add_training.dart';
import 'package:football_next_gen/pages/sports_center/trainings/trainings_list.dart';
import 'package:football_next_gen/widgets/confirm_page.dart';
import 'package:go_router/go_router.dart';
import '../pages/login_section/register/parent/parent_register.dart';
import '../pages/login_section/register/register.dart';
import '../pages/login_section/register/sports_center/sports_center.dart';
import '../pages/sports_center/teams/team_detail.dart';
import '../pages/sports_center/teams/teams_list.dart';
import '../pages/sports_center/trainings/filters.dart';
import '../pages/sports_center/trainings/training_detail.dart';



class RouterManager {
  static final RouterManager _router = RouterManager._internal();
  factory RouterManager() {
    return _router;
  }


  RouterManager._internal();



  final GoRouter goRouter =
  GoRouter(
      routes: [
        // Go_router default goes to "/" page
        GoRoute(
            path: "/",
            builder: (context, state) => Login()
        ),
        GoRoute(
            path: "/register",
            builder: (context, state) => Register()
        ),
        GoRoute(
            path: "/recover_password",
            builder: (context, state) => RecoverPassword()
        ),

        GoRoute(
            path: "/sports_center_register",
            builder: (context, state) => const SportsCenterRegister()
        ),

        GoRoute(
            path: "/parent_register",
            builder: (context, state) => const ParentRegister()
        ),

        GoRoute(
            path: "/insert_otp",
            builder: (context, state) => const InsertOtp()
        ),

        GoRoute(
            path: "/home_sports_center",
            builder: (context, state) => const HomeSportsCenter()
        ),

        GoRoute(
            path: "/sports_center_profile",
            builder: (context, state) => const SportsCenterProfile()
        ),

        GoRoute(
            path: "/teams_list",
            builder: (context, state) => const TeamsList()
        ),

        GoRoute(
            path: "/add_team",
            builder: (context, state) {
              var extraObject = state.extra as dynamic;
              var edit = extraObject['edit'];
              var isHome = extraObject['isHome'];
              return AddTeam(edit: edit, isHome: isHome);
            }
        ),

        GoRoute(
            path: "/team_detail",
            builder: (context, state)  {
              var extraObject = state.extra as dynamic;
              var id = extraObject['id'];
              var isHome = extraObject['isHome'];
              return TeamDetail(id: id, isHome: isHome);
            }
        ),

        GoRoute(
            path: "/tournaments_list",
            builder: (context, state) => TournamentsList(returnPage: state.extra.toString())
        ),

        GoRoute(
            path: "/add_tournament",
            builder: (context, state) {
              return AddTournament(edit: state.extra as bool);
            }
        ),

        GoRoute(
            path: "/tournament_detail",
            builder: (context, state) {
              return TournamentDetail(tournamentId: state.extra as int);
            }
        ),

        GoRoute(
            path: "/group_detail",
            builder: (context, state) {
              var extraObject = state.extra as dynamic;
              var id = extraObject['id'];
              var tournamentId = extraObject['tournamentId'];
              var groupName = extraObject['name'];
              return GroupDetail(id: id, tournamentId: tournamentId, groupName: groupName);
            }
        ),

        GoRoute(
            path: "/add_group",
            builder: (context, state) {
              var extraObject = state.extra as dynamic;
              var id = extraObject['id'];
              var edit = extraObject['edit'];
              return AddGroup(id: id, edit: edit,);
            }
        ),

        GoRoute(
            path: "/trainings_list",
            builder: (context, state) => const TrainingsList()
        ),

        GoRoute(
            path: "/add_training",
            builder: (context, state) {
              var extraObject = state.extra as dynamic;
              var date = extraObject['date'];
              var edit = extraObject['edit'];
              return AddTraining(date: date, edit: edit);
            }
        ),

        GoRoute(
            path: "/training_detail",
            builder: (context, state) => TrainingDetail(id: state.extra as int)
        ),

        GoRoute(
            path: "/filters",
            builder: (context, state) => const Filters()
        ),

        GoRoute(
            path: "/settings",
            builder: (context, state) => Settings(returnPage: state.extra as String)
        ),

        GoRoute(
            path: "/reset_password",
            builder: (context, state) => const ResetPassword()
        ),


        GoRoute(
            path: "/add_post",
            builder: (context, state) {
              return AddPost(returnPage: state.extra as String);
            }
        ),

        GoRoute(
            path: "/post_detail",
            builder: (context, state) {
              var extraObject = state.extra as dynamic;
              var id = int.tryParse(extraObject['id']) ?? 0; // Converti la stringa ID in un intero
              var path = extraObject['path'] ?? "";
              return PostDetail(id: id, returnPage: path);
            }
        ),

        GoRoute(
            path: "/home_child",
            builder: (context, state) => const HomeChild()
        ),

        GoRoute(
            path: "/menu_child",
            builder: (context, state) => const MenuChild()
        ),

        GoRoute(
            path: "/child_profile",
            builder: (context, state) => const ChildProfile()
        ),

        GoRoute(
            path: "/followers_list",
            builder: (context, state) => const FollowersList()
        ),

        GoRoute(
            path: "/edit_profile",
            builder: (context, state) => const EditProfile()
        ),


        GoRoute(
            path: "/confirm_page",
            builder: (context, state) {
              ConfirmPageData confirmPageData = state.extra as ConfirmPageData;
              return ConfirmPage(data: confirmPageData);
            }
        ),
      ],
      // Here we manage the user authentication state
      redirect: (_, state) {
        var auth = AuthListener().profile;
        var token = AuthListener().token;

        // return state.location se l'utente può andare nella destinazione richiesta (quella attuale)
        if (token == null){
          if(createAccount(state.uri.path)){
            return state.uri.path;
          }else{
            return AppPage.login.path;
          }
        }
        if (auth?.role == 'genitore') {
          if (isChildProfile(state.uri.path)) {
            return state.uri.path;
          } else {
            return AppPage.homeChild.path;
          }
        }
        if (auth?.role == 'bambino') {
          if (isChildProfile(state.uri.path)) {
            return state.uri.path;
          } else {
            return AppPage.homeChild.path;
          }
        }
        if (auth?.role == 'centro_sportivo') {
          if(isSportCenterPage(state.uri.path)){
            return state.uri.path;
          }else{
            return AppPage.homeSportsCenter.path;
          }
        }
        // if (ruolo.........  .. . .. .


        /*if ((auth == null || token == null) && !authPath) {
          if ( == AppPage.loadingpage.path) {
            return AppPage.login.path;
          }
          return state.location;
        }
        if ((auth == null || token == null) && authPath) {
          return AppPage.login.path;
        }
        // HERE I AM LOGGED IN
        if (state.location == AppPage.login.path) {
          return AppPage.dashboard.path;
        }
        if (state.location == AppPage.loadingpage.path) {
          return AppPage.dashboard.path;
        }
        return state.location; */
      },
      refreshListenable: AuthListener()
  );

}
bool createAccount(String path){
  if(
  path.contains(AppPage.register.path) ||
      path.contains(AppPage.parentRegister.path) ||
      path.contains(AppPage.recoverPassword.path) ||
      path.contains(AppPage.sportsCenterRegister.path
      )
  ){
    return true;
  }else{
    return false;
  }
}

bool isSportCenterPage (String path){
  if(
  path.contains(AppPage.sportsCenterProfile.path) ||
      path.contains(AppPage.settings.path) ||
      path.contains(AppPage.addPost.path) ||
      path.contains(AppPage.postDetail.path) ||
      path.contains(AppPage.tournamentsList.path)||
      path.contains(AppPage.tournamentDetail.path) ||
      path.contains(AppPage.confirmPage.path) ||
      path.contains(AppPage.addGroup.path) ||
      path.contains(AppPage.groupDetail.path) ||
      path.contains(AppPage.resetPassword.path) ||
      path.contains(AppPage.addTournament.path) ||
      path.contains(AppPage.trainingsList.path) ||
      path.contains(AppPage.trainingDetail.path) ||
      path.contains(AppPage.addTraining.path) ||
      path.contains(AppPage.teamsList.path) ||
      path.contains(AppPage.filters.path) ||
      path.contains(AppPage.addTeam.path) ||
      path.contains(AppPage.teamDetail.path) ||
      path.contains(AppPage.followerList.path) ||
      path.contains(AppPage.editProfile.path)

  ){
    return true;
  }else{
    return false;
  }
}


bool isChildProfile(String path){
  if(
  path.contains(AppPage.childProfile.path) ||
      path.contains(AppPage.settings.path) ||
      path.contains(AppPage.addPost.path) ||
      path.contains(AppPage.postDetail.path) ||
      path.contains(AppPage.tournamentsList.path)||
      path.contains(AppPage.tournamentDetail.path) ||
      path.contains(AppPage.confirmPage.path) ||
      path.contains(AppPage.groupDetail.path) ||
      path.contains(AppPage.trainingsList.path) ||
      path.contains(AppPage.trainingDetail.path) ||
      path.contains(AppPage.teamsList.path) ||
      path.contains(AppPage.filters.path) ||
      path.contains(AppPage.teamDetail.path) ||
      path.contains(AppPage.followerList.path) ||
      path.contains(AppPage.editProfile.path)||
      path.contains(AppPage.menuChild.path)
  ){
    return true;
  }else{
    return false;
  }
}