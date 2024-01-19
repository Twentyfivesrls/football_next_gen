import 'package:football_next_gen/models/confirm_page_data.dart';
import 'package:football_next_gen/pages/login_section/login/login.dart';
import 'package:football_next_gen/pages/login_section/recover_password/recover_password.dart';
import 'package:football_next_gen/pages/login_section/register/insert_otp.dart';
import 'package:football_next_gen/pages/sports_center/home_sports_center.dart';
import 'package:football_next_gen/pages/sports_center/profile/sports_center_profile.dart';
import 'package:football_next_gen/pages/sports_center/teams/add_team.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/add_tournament.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/tournament_detail.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/tournaments_list.dart';
import 'package:football_next_gen/widgets/confirm_page.dart';
import 'package:go_router/go_router.dart';
import '../pages/login_section/register/parent/parent_register.dart';
import '../pages/login_section/register/register.dart';
import '../pages/login_section/register/sports_center/sports_center.dart';
import '../pages/sports_center/teams/team_detail.dart';
import '../pages/sports_center/teams/teams_list.dart';


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
          builder: (context, state) => const Login()
      ),
      GoRoute(
          path: "/register",
          builder: (context, state) => const Register()
      ),
      GoRoute(
          path: "/recover_password",
          builder: (context, state) => const RecoverPassword()
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
          builder: (context, state) => AddTeam()
      ),

      GoRoute(
          path: "/team_detail",
          builder: (context, state) => const TeamDetail()
      ),

      GoRoute(
          path: "/tournaments_list",
          builder: (context, state) => const TournamentsList()
      ),

      GoRoute(
          path: "/add_tournament",
          builder: (context, state) => AddTournament()
      ),

      GoRoute(
          path: "/tournament_detail",
          builder: (context, state) => const TournamentDetail()
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