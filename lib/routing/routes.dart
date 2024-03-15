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
          builder: (context, state) => const AddTeam()
      ),

      GoRoute(
          path: "/team_detail",
          builder: (context, state)  {
            var extraObject = state.extra as dynamic;
            var id = extraObject['id'] ?? "";
            var isHome = extraObject['isHome'] ?? true;
            return TeamDetail(id: id, isHome: isHome);
          }
      ),

      GoRoute(
          path: "/tournaments_list",
          builder: (context, state) => TournamentsList(returnPage: state.extra as String)
      ),

      GoRoute(
          path: "/add_tournament",
          builder: (context, state) => const AddTournament()
      ),

      GoRoute(
          path: "/tournament_detail",
          builder: (context, state) {
            return TournamentDetail(tournamentId: state.extra as String);
          }
      ),

      GoRoute(
          path: "/group_detail",
          builder: (context, state) {
            var extraObject = state.extra as dynamic;
            var id = extraObject['id'] ?? "";
            var tournamentId = extraObject['tournamentId'] ?? "";
            return GroupDetail(id: id, tournamentId: tournamentId);
          }
      ),

      GoRoute(
          path: "/add_group",
          builder: (context, state) => AddGroup(id: state.extra as String)
      ),

      GoRoute(
          path: "/trainings_list",
          builder: (context, state) => const TrainingsList()
      ),

      GoRoute(
          path: "/add_training",
          builder: (context, state) => const AddTraining()
      ),

      GoRoute(
          path: "/training_detail",
          builder: (context, state) => TrainingDetail(id: state.extra as String)
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
            var id = extraObject['id'] ?? "";
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
          path: "/confirm_page",
          builder: (context, state) {
            ConfirmPageData confirmPageData = state.extra as ConfirmPageData;
            return ConfirmPage(data: confirmPageData);
          }
      ),
    ],
  );
}